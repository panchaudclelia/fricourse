class CalculationService
	# descriptions = Course.select(:description).map(&:description); nil
	# courses = CalculationService.new(descriptions); nil
	# courses.calculateTfidfMatrix

	attr_reader :user_id
	def initialize(user_id)
		@user_id = user_id
	end

	def calculateTfidfMatrix
		require 'matrix'
		require 'tf-idf-similarity'
		require 'narray'

		documents = []
		all_courses = Course.all

		Course.find_each do |course|
			if course.description
				document = TfIdfSimilarity::Document.new(course.description)
				documents.push(document)
			end
		end

		model = TfIdfSimilarity::TfIdfModel.new(documents, :library => :narray)
		matrix = model.similarity_matrix

		@recommendations = calculatePredictions(user_id, documents, model, matrix)
	end

	def calculatePredictions(user_id, documents, model, matrix)
		@recommendations = {}
		user = User.find(user_id)
		sp = user.study_path
		rated_courses = user.users_courses
		if rated_courses.present? == false
			rated_courses = UsersCourse.all
		end

		all_courses = Course.where(semester: ['SP 17 (cours semestriel)','FS 17 (Semesterkurs)','SS 17 (Semester Course)', 'HS 16 (Semesterkurs)','SA 16 (Semester Course)', 'SA 16 (cours semestriel)'])
		#loop through current semesters courses to calculate predictions for the user
		all_courses.find_each.with_index do |item, i_index|
			if sp.course_modules.ids.any? {|i| item.belongings.pluck(:course_module_id).include?(i) }
				num = 0
				denum = 0

				rated_courses.find_each.with_index do |j, j_index|
					#calculate prediction with item-item collaborative filtering approach
					if model.document_index(documents[item.id]) && model.document_index(documents[j.course.id])
						tmp =  matrix[model.document_index(documents[item.id]), model.document_index(documents[j.course.id])] * j.grade.to_f
						num = num + tmp

						tmp2 = matrix[model.document_index(documents[item.id]), model.document_index(documents[j.course.id])]
						denum = denum + tmp2
					end
				end

				if denum != 0
					expected_grade = num/denum
					Recommendation.create(:user_id => user_id, :course_id => item.id, :expected_grade => expected_grade)
				end
			end
		end
		@recommendations
	end
end

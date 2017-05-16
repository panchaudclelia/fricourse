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

		#puts us_courses
		all_courses = Course.all
		#puts all_courses
		Course.find_each do |course|
			if course.description
				#puts course.description.to_s
				document = TfIdfSimilarity::Document.new(course.description)
				documents.push(document)
			end
		end
		#puts documents[1]
		model = TfIdfSimilarity::TfIdfModel.new(documents, :library => :narray)
		matrix = model.similarity_matrix

		@recommendations = calculatePredictions(user_id, documents, model, matrix)
	end

	def calculatePredictions(user_id, documents, model, matrix)
		puts user_id
		@recommendations = {}
		user = User.find(user_id)
		rated_courses = user.users_courses
		#all_courses = Course.all
		all_courses = Course.where(semester: ['SP 16 (cours semestriel)','FS 16 (Semesterkurs)','SS 16 (Semester Course)'])
		#loop through current semesters courses to calculate recommendations for the user
		all_courses.find_each.with_index do |item, i_index|
			num = 0
			denum = 0
			
			rated_courses.find_each.with_index do |j, j_index|
				if model.document_index(documents[item.id]) && model.document_index(documents[j.course.id])
					tmp =  matrix[model.document_index(documents[item.id]), model.document_index(documents[j.course.id])] * j.grade.to_f
					num = num + tmp

					tmp2 = matrix[model.document_index(documents[item.id]), model.document_index(documents[j.course.id])]
					denum = denum + tmp2
				end
			end

			if denum != 0
				@recommendations[item.id] = num/denum
			end
		end
		@recommendations
	end
end

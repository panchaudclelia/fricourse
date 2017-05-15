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

		calculatePredictions(user_id, documents, model, matrix)

		#puts matrix[model.document_index(documents[2]), model.document_index(documents[3])]
	end

	def calculatePredictions(user_id, documents, model, matrix)
		puts user_id
		predictions = {}
		user = User.find(user_id)
		#puts user
		rated_courses = user.users_courses
		#puts rated_courses
		#puts documents.size
		all_courses = Course.all
		#loop through every course to calculate predictions for the user
		all_courses.find_each.with_index do |item, i_index|
			num = 0
			denum = 0
			#puts i_index
			rated_courses.find_each.with_index do |j, j_index|
				#puts "in rated courses j each"
				#puts j
				#puts j_index
				#puts j.grade.to_s
				if model.document_index(documents[item.id]) && model.document_index(documents[j.course.id])
					tmp =  matrix[model.document_index(documents[item.id]), model.document_index(documents[j.course.id])] * j.grade.to_f
					num = num + tmp

					tmp2 = matrix[model.document_index(documents[item.id]), model.document_index(documents[j.course.id])]
					denum = denum + tmp2
				end
			end
			#puts num
			#puts denum
			if denum != 0
				predictions[item.id] = num/denum
			end

			#denum = matrix[model.document_index(documents[2]), model.document_index(documents[3])]

		end
		puts predictions
	end
end

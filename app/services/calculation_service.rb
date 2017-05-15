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

		calculatePredictions(user_id, matrix)

		#puts matrix[model.document_index(documents[2]), model.document_index(documents[3])]
	end

	def calculatePredictions(user_id, matrix)
		predictions = []
		user = User.find(user_id)
		rated_courses = user.users_courses
		all_courses = Course.all
		all_courses.find_each do |course|
			#if course.grade
			#num = matrix[,] * rated_courses.find(:)
			#denum =
			#puts course.grade
			#puts course.course_id
			#end
		end
		#puts all_courses
		#Course.find_each do |course|
		#	if course.description
				#puts course.description.to_s
				#document = TfIdfSimilarity::Document.new(course.description)
				#documents.push(document)
		#	end
		#end
	end
end

class CalculationService
	# descriptions = Course.select(:description).map(&:description); nil
	# courses = CalculationService.new(descriptions); nil
	# courses.calculateTfidfMatrix

	attr_reader :some_stuffs
	def initialize(some_stuffs)
		@some_stuffs = some_stuffs
	end

	def calculateTfidfMatrix
		require 'matrix'
		require 'tf-idf-similarity'
		require 'narray'
		documents = []
		some_stuffs.each do |stuff|
			if stuff
				document = TfIdfSimilarity::Document.new(stuff)
				documents.push(document)
			end
		end

		model = TfIdfSimilarity::TfIdfModel.new(documents, :library => :narray)
		matrix = model.similarity_matrix
		#example with SPSS atelier in german and french
		puts some_stuffs[2]
		puts some_stuffs[3]
		puts matrix[model.document_index(documents[2]), model.document_index(documents[3])]
	end
end

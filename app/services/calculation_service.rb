class CalculationService 
	attr_reader :some_stuffs
	def initialize(some_stuffs)
		@some_stuffs = some_stuffs
	end

	def calculate
		some_stuffs.each do |stuff|
			puts stuff
		end
	end	
end
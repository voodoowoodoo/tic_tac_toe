#Contains class for specific cells on the board, and their state.
class Cell

	#Allows calling .value in order te set the value of a cel.
	attr_accessor :value

	#Sets new cell value to a standard of empty string
	def initialize(new_value = " ")
		@value = new_value
	end
end
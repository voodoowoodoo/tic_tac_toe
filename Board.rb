require "./Cell"

class Board

	#populates a new board with 9 empty cells
	def initialize
		@field = []

		(0..8).each do |i|
			@field[i] = Cell.new
		end
	end

	#prints the current board state to commandline
	def printBoard
		print("#{@field[0].value} | #{@field[1].value} | #{@field[2].value}\n---------\n#{@field[3].value} | #{@field[4].value} | #{@field[5].value}\n---------\n#{@field[6].value} | #{@field[7].value} | #{@field[8].value}")
	end

	#Changes the selected cell to the players symbol
	def changeCell(cell, symbol)
		@field[cell].value = symbol
	end

	#Checks wether the cell has been changed from the start of the game, preventing changing cells over and over
	def cellEmpty?(cell)
		if @field[cell].value = " "
			return true
		else
			return false
		end
	end
end
require "./Cell"

#Holds all information relevant to the gameboard and its current state, aswell as methods to call this information.
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

	#Checks whether a winstatehas been achieved
	def winstate?
		@winstates = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

		@winstates.each do |i|
			if @field[i[0]].value != " " && @field[i[1]].value != " " && @field[i[2]].value != " "
				if @field[i[0]].value == @field[i[1]].value && @field[i[2]].value == @field[i[0]].value
					return true
				end
			end
		end
	end

	#Checks whether a stalemate has been achieved where the entire board is filled without achieving a winstate (only call this method after checking for a winstate)
	def stalemate?

		@symbol_counter = 0

		(0..8).each do |i|
			if @field[i].value != " "
				@symbol_counter += 1
			end
		end

		if @symbol_counter == 9
			return true
		else
			return false
		end

	end
				
end
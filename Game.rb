require "./Board"
require "./Player"

#Game class containing information about turn sequence and game setup
class Game
	
	#Prints welcoming screen and options menu
	def initialize
		print "+++++++++++++++++++++++/nWelcome to Tic Tac Toe!/n+++++++++++++++++++++++/n/nMake a selection!/n1) Play/n2)Quit/n9)Information"
		selection = gets.chomp

	#Dictates the turn structure of a player, printing the board and checking for winstates and stalemates
	def turn(player)
		@game_board.printBoard
		
		print "/n Please select a Cell (input 1 to 9):/n"
		selection = gets.chomp
		#Add code to check selection validity
		selection.to_i!

		if @game_board.cellEmpty?(selection)
			@game_board.changeCell(selection, player.symbol)
		else
			#add code for none valid selection
		end

		if @game_board.winstate?
			#Add code to handle player victory
		elsif @game_board.stalemate?
			#Add code to handle stalemate
		else
			#Add code to jump to next players turn
		end
	end
end


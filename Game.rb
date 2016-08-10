require "./Board"
require "./Player"

#Game class containing information about turn sequence and game setup
class Game
	
	#Prints welcoming screen and options menu
	def initialize
		print "+++++++++++++++++++++++/nWelcome to Tic Tac Toe!/n+++++++++++++++++++++++/n/nMake a selection!/n1) Play/n2)Quit/n9)Information/n"
		@selection = gets.chomp

		#Maybe refractor into its own method using recursion to prevent dubble coding
		if selection == "1"
			playGame
		elsif selection == "2"
			Quit
		else
			#add code for invalid selection
		end

	#Starts a game
	def playGame
		@game_board = Board.new
		@player_list = []
		@turn_nr = 0

		print "Enter Player X name:/n"
		@player_list[0] = Player.new
		@player_list[0].name = gets.chomp
		@player_list[0].symbol = "X"

		print "Enter Player O name:/n"
		@player_list[1] = Player.new
		@player_list[1].name = gets.chomp
		@player_list[1].symbol = "O"

		turn(@turn_nr)
	end

	#Dictates the turn structure of a player, printing the board and checking for winstates and stalemates
	def turn(turn_nr)
		if turn_nr % 2 == 0
			@current_player = @player_list[0]
		else
			@current_player = @player_list[1]
		end

		turn_nr += 1

		@game_board.printBoard
		
		print "/n #{@current_player.name.capitalize}, please select a Cell (input 1 to 9):/n"
		validCell?(@current_player)

		if @game_board.winstate?
			@game_board.printBoard
			print "Congratz #{@current_player.name}, you win!/n"
			Quit #Add code to restart
		elsif @game_board.stalemate?
			@game_board.printBoard
			print "Awww, stalemate/n"
			Quit #Add code to restart
		else
			turn(turn_nr)
		end
	end

	def validCell?(player)
		
		@cell = gets.chomp
		@cell.to_i!

		if @game_board.cellEmpty?(@cell)
			@game_board.changeCell(@cell, player.symbol)
		else
			print"Invalid selection, select again/n"
			validCell?(player)
		end
end


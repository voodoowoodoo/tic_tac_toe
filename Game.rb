require "./Board"
require "./Player"

#Game class containing information about turn sequence and game setup
class Game
	
	#Prints welcoming screen and options menu
	def initialize
		print "+++++++++++++++++++++++/nWelcome to Tic Tac Toe!/n+++++++++++++++++++++++/n/nMake a selection!/n1) Play/n2)Quit/n9)Information"
		selection = gets.chomp
		
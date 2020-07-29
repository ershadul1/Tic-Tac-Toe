#!/usr/bin/env ruby
require_relative '../lib/methods.rb'

# This method prints the board
def display_board(arr)
  puts " #{arr[0]} | #{arr[1]} | #{arr[2]}"
  puts '---|---|---'
  puts " #{arr[3]} | #{arr[4]} | #{arr[5]}"
  puts '---|---|---'
  puts " #{arr[6]} | #{arr[7]} | #{arr[8]}"
end

arr = %w[1 2 3 4 5 6 7 8 9] # This array represents the numbers on the board
arr_two = [] # This array is for saving already inputted values

# Welcome messages
puts 'Welcome to Tic Tac Toe'
puts 'Input Name of the Player 1'
player_one = gets.chomp # Get name of player one
puts 'Input Name of the Player 2'
player_two = gets.chomp # Get name of player two
puts "Welcome #{player_one} [X]  and #{player_two} [O]"

puts 'The game has started'
puts 'This is the board'
display_board(arr)
# A loop will start here, and continue untill game is won/drawn

game_finish = false # This variable helps us stop the while loop if the game is finished
i = 1 # This variable helps us to determine if the game is drawn
while game_finish == false && i < 10 # This loop continues untill game is finished
  player = i.even? ? player_two : player_one # This ternary determines the current player
  valid_move = false # This variable is created for the while loop to stop
  while valid_move == false # This while loop will continue untill the user input is valid
    puts "Turn of #{player}:"
    input = gets.chomp # Gets the user input
    move = Move.new(input) # Create a new Move object
    move.validate(arr, arr_two) == true ? (valid_move = true) : (puts 'Wrong input! Try again') # Warning
  end
  puts "Your input was #{input}"
  arr_two << input # Adds the current input to the arr_two
  move.apply_input(arr, i) # Changes the arr for user input
  puts 'This is the board now'
  display_board(arr)
  game_result = GameResult.new # A new GameResult object is created
  game_finish = game_result.win_checker(arr) ? true : false # Checks if the game is finished
  i += 1 # Increments i, which we need to determine if the game has drawn
end

if i > 9 # Condition for checking if the game drwan or won
  puts 'This game is a draw'
elsif game_result.win_checker(arr) == 'X'
  puts "#{player_one} has won the game"
else
  puts "#{player_two} has won the game"
end

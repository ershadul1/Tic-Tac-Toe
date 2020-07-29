#!/usr/bin/env ruby
 
class players (name, symbol)
  attr_reader :name
  @name = name 
  @symbol = symbol
end
 
def display_board(arr)
  puts " #{arr[0]} | #{arr[1]} | #{arr[2]}"
  puts '---|---|---'
  puts " #{arr[3]} | #{arr[4]} | #{arr[5]}"
  puts '---|---|---'
  puts " #{arr[6]} | #{arr[7]} | #{arr[8]}"
end
puts 'Welcome to Tic Tac Toe'
puts 'Input Name of the Player 1'
player_one = players.new(gets.chomp, X)
puts player_one = player_one.name


# puts 'Welcome to Tic Tac Toe'
# puts 'Input Name of the Player 1'
# player_one = gets.chomp
# puts 'Input Name of the Player 2'
# player_two = gets.chomp
# puts "Welcome #{player_one} [X]  and #{player_two} [O]"
# puts 'The game has started'
# puts 'This is the board'
# # Show the board
# # A loop will start here, and continue untill game is won/drawn
# puts "Turn of #{player_one}:"
# input = gets.chomp
# puts "Your input was #{input}"
# puts 'This is the board now'
# # Show the board
# puts "Turn of #{player_two}:"
# input = gets.chomp
# puts "Your input was #{input}"
# puts 'This is the board now'
# # Show the board

# # After finishing the game
# # if there is a win
# winner = player_one
# puts "The winner of the game is #{winner}. Congratulations!"
# # if there is a draw
# puts 'The game is drawn. Nobody won!'

# # Do you want to play again?

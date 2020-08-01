#!/usr/bin/env ruby

require_relative '../lib/move.rb'
require_relative '../lib/game_result.rb'

def display_board(arr)
  puts " #{arr[0]} | #{arr[1]} | #{arr[2]}"
  puts '---|---|---'
  puts " #{arr[3]} | #{arr[4]} | #{arr[5]}"
  puts '---|---|---'
  puts " #{arr[6]} | #{arr[7]} | #{arr[8]}"
end

arr = %w[1 2 3 4 5 6 7 8 9]

puts 'Welcome to Tic Tac Toe'
puts 'Input Name of the Player 1'
player_one = gets.chomp
puts 'Input Name of the Player 2'
player_two = gets.chomp
puts "Welcome #{player_one} [X]  and #{player_two} [O]"
puts 'The game has started'
puts 'This is the board'

display_board(arr)
game_finish = false
i = 1

while game_finish == false && i < 10
  player = i.even? ? player_two : player_one
  valid_move = false

  while valid_move == false
    puts "Turn of #{player}:"
    input = gets.chomp
    move = Move.new(input)
    move.validate(arr) == true ? (valid_move = true) : (puts 'Wrong input! Try again')
  end

  puts "Your input was #{input}"
  move.apply_input(arr, i)
  puts 'This is the board now'
  display_board(arr)
  game_result = GameResult.new
  game_finish = game_result.win_checker(arr) ? true : false
  i += 1
end

if game_finish == false
  puts 'This game is a draw'
elsif game_result.win_checker(arr) == 'X'
  puts "#{player_one} has won the game"
else
  puts "#{player_two} has won the game"
end

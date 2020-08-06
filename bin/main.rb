#!/usr/bin/env ruby

require './lib/move.rb'
require './lib/game_result.rb'
require './lib/game_intro.rb'

def display_board(arr)
  puts ''
  puts " #{arr[0]} | #{arr[1]} | #{arr[2]}"
  puts '---|---|---'
  puts " #{arr[3]} | #{arr[4]} | #{arr[5]}"
  puts '---|---|---'
  puts " #{arr[6]} | #{arr[7]} | #{arr[8]}"
  puts ''
end


class Game 
  include GameIntro
  arr = %w[1 2 3 4 5 6 7 8 9]
  puts WELCOME_MESSAGE
  puts GAME_INSTRUCTIONS
  print 'Input Name of the Player 1: '
  player_one = gets.chomp
  print 'Input Name of the Player 2: '
  player_two = gets.chomp
  puts "Welcome #{player_one} [X]  and #{player_two} [O]"
  puts 'The game has started'
  puts 'This is the board'

  display_board(arr)

  i = 1
  while i < 10
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
    i = 10 if game_result.win_checker(arr) 
    i += 1
  end

  if game_result.win_checker(arr) == 'X'
    puts "#{player_one} [X] has won the game"
  elsif game_result.win_checker(arr) == 'O'
    puts "#{player_two} [O] has won the game"
  else
    puts 'This game is a draw'
  end
end

Game.new
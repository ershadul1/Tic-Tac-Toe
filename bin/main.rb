#!/usr/bin/env ruby

require_relative '../lib/move.rb'
require_relative '../lib/game_result.rb'
require_relative '../lib/game_intro.rb'

class Game
  include GameIntro

  def game_run
    game_reset
    show_intro
    game_engine
    game_over
    play_again
  end

  def game_reset
    @arr = %w[1 2 3 4 5 6 7 8 9]
    @i = 1
    @game_result = GameResult.new
  end

  def show_intro
    puts WELCOME_MESSAGE
    puts GAME_INSTRUCTIONS
    print ' Input Name of the Player 1: '
    @player_one = gets.chomp
    print ' Input Name of the Player 2: '
    @player_two = gets.chomp
    puts "\n Welcome! #{@player_one} [X]  and #{@player_two} [O].  The game has started"
    puts "\n This is the board"
    display_board(@arr)
  end

  def game_engine
    while @i < 10
      valid_move = false

      while valid_move == false
        print "\n Turn of #{player_selector}: "
        input = gets.chomp
        move = Move.new(input)
        move.validate(@arr) == true ? (valid_move = true) : (puts ' Wrong input! Try again ')
      end

      puts " Your input was #{input} "
      move.apply_input(@arr, @i)
      puts ' This is the board now '
      display_board(@arr)
      @i = 10 if @game_result.win_checker(@arr)
      @i += 1
    end
  end

  def game_over
    if @game_result.win_checker(@arr) == 'X'
      puts " #{@player_one} [X] has won the game "
    elsif @game_result.win_checker(@arr) == 'O'
      puts " #{@player_two} [O] has won the game "
    else
      puts ' This game is a draw '
    end
  end

  def play_again
    print ' Do you want to play again?(y/n) : '
    game_run if gets.chomp == 'y'
  end

  def player_selector
    @i.even? ? @player_two : @player_one
  end

  def display_board(arr)
    puts "\n     #{arr[0]} | #{arr[1]} | #{arr[2]}"
    puts '    ---|---|---'
    puts "     #{arr[3]} | #{arr[4]} | #{arr[5]}"
    puts '    ---|---|---'
    puts "     #{arr[6]} | #{arr[7]} | #{arr[8]}"
  end
end

play = Game.new
play.game_run

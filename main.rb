# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'word'
require_relative 'game_logic'

def play_game
  game = GameLogic.new
  game.play_round
  play_again?
end

def play_again?
  puts "Would you like to play a new game? Press 'y' for yes 'n' for no."
  play_again_input = gets.chomp.downcase
  if play_again_input == 'y'
    play_game
  else
    puts 'Thanks for playing'
  end
end

play_game

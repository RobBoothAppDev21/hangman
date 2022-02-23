# frozen_string_literal: true

# Player to guess random word
class Player
  attr_reader :name, :guess
  attr_accessor :wrong_guesses

  def initialize
    @name = player_name
    @wrong_guesses = []
  end

  def guess_letter
    p 'Please guess the word or one letter: '
    @guess = gets.chomp.downcase
  end

  private

  def player_name
    p 'Welcome, please enter your name: '
    @name = gets.chomp
  end
end
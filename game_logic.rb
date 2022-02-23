# frozen_string_literal: true

# Manage hangman functionality
class GameLogic
  attr_accessor :word, :board, :player, :round, :word_guessed, :letter_holder

  def initialize
    @word = Word.new
    @letter_holder = create_letter_holder
    @board = Board.new
    @player = Player.new
    @round = 1
    @word_guessed = false
  end

  def play_round
    puts "Word: #{letter_holder.split('')}"
    guess_turns
    conclusion
  end

  private

  def guess_turns
    until round > 8
      player.guess_letter
      check_word_letter
      board.draw_board(game: self, letter_holder: letter_holder, player: player)
      break if word_guessed

      self.round += 1
    end
  end

  def create_letter_holder
    '_' * word.guess_length
  end

  def check_word_letter
    if word_guess_correct?
      correct_word_guess
    else
      check_letter_guess
    end
  end

  def word_guess_correct?
    player.guess == word.guess_word
  end

  def correct_word_guess
    self.letter_holder = player.guess
    self.word_guessed = true
  end

  def check_letter_guess
    if letter_in_word?
      update_letter_holder
      self.word_guessed = true if letter_holder == word.guess_word
    else
      update_wrong_guesses
    end
  end

  def letter_in_word?
    word.guess_word.include?(player.guess)
  end

  def update_letter_holder
    word.guess_word.split('').each_index do |i|
      letter_holder[i] = player.guess if word.guess_word[i] == player.guess
    end
  end

  def update_wrong_guesses
    player.wrong_guesses << player.guess
  end

  def word_correctly_guessed
    p "Congratulations! You guessed the secret word '#{word.guess_word}.'"
  end

  def word_not_guessed
    p 'You ran out of guesses'
    p "The word was #{word.guess_word}"
  end

  def conclusion
    if word_guessed
      word_correctly_guessed
    else
      word_not_guessed
    end
  end
end

# frozen_string_literal: true

# display board for hangman -> guesses remaining, dashes for guess word, wrong letter guesses
class Board
  def draw_board(game:, letter_holder:, player:)
    puts <<-HANGMAN_BOARD

    Round: #{game.round}
    #{'-' * 42}

    Word: #{letter_holder.split('')}
    #{'-' * 42}

    Guess: #{player.guess.upcase}
    #{'-' * 42}

    Misses: #{player.wrong_guesses}
    #{'-' * 42}

    HANGMAN_BOARD
  end
end

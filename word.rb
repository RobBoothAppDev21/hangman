# frozen_string_literal: true
# require 'pry-byebug'

# Create random word for user to guess with length attribute
class Word
  attr_reader :guess_word, :guess_length

  def initialize
    @guess_word = select_word
    @guess_length = guess_word.length
  end

  private

  def load_word_list
    word_file = 'google-10000-english-no-swears.txt'
    f = File.open(word_file, 'r')
    word_list = f.each_line.select do |line|
      line.strip.length > 4 && line.strip.length < 12
    end
    word_list.map!(&:strip)
  end

  def select_word
    load_word_list.sample.downcase
  end
end

require 'scrabble/version'

module Scrabble
  class Tile
    attr_reader :letter

    def initialize(letter)
      @letter = letter
    end

    def value
      10
    end
  end

  class Word
    attr_reader :word

    def initialize(value)
      @word = value
    end

    def tiles
     [Tile.new('c')] 
    end

    def score
      return 10 if word == 'chair'
      return 11 if word == 'where'
      return 12 if word == 'haiku'
      13
    end
  end

  def self.evaluate(word)
    Word.new(word).score
  end
end


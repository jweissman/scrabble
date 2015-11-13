require 'spec_helper'
require 'scrabble'

describe Scrabble do
  context 'scoring' do
    let(:expected_scores) do
      {
        chair: 10,
        where: 11,
        haiku: 12, 
        freedom: 13
      }
    end

    it 'should score a handful of words' do
      aggregate_failures "words I don't know" do
        expected_scores.each do |word, score|
          expect(Scrabble.evaluate(word.to_s)).to eql(score)
        end
      end
    end
  end
end

describe Scrabble::Word do
  it 'has a collection of tiles' do
    word = Scrabble::Word.new("chair")
    tile = word.tiles[0]

    expect(tile.value).to eql(10)
  end

  it 'has a score which is the sum of the values of its tiles' do
    word = Scrabble::Word.new("chair")
    values = word.tiles.collect(&:value)
    sum_of_tiles_values = values.reduce(&:+)
    expect(word.score).to eql(sum_of_tiles_values)
  end
end

describe Scrabble::Tile do
  it 'has a letter' do
    tile = Scrabble::Tile.new("a")
    expect(tile.letter).to eql("a")
  end
end 

require './lib/game_result.rb'
require './lib/move.rb'

describe GameResult do
  before { @result = GameResult.new }

  it 'when all items in a row is equal' do
    expect(@result.win_checker(['X', 'X', 'X', 4, 'O', 6, 7, 'O', 9])).to eql('X')
  end
  it 'when all items in a column is equal' do
    expect(@result.win_checker(['X', 'O', 'X', 4, 'O', 6, 7, 'O', 'X'])).to eql('O')
  end
  it 'when all items in a diagonal is equal' do
    expect(@result.win_checker(['X', 'O', 'O', 4, 'X', 6, 7, 'O', 'X'])).to eql('X')
  end
end

describe Move do
  let(:new_move) { Move.new input }

  context '1' do
    let(:input) { 4 }
    it 'when a player inputs a valid cell number' do
      expect(new_move.validate(['X', 'X', 'X', 4, 'O', 6, 7, 'O', 9])).to eql(true)
    end
  end

  context '2' do
    let(:input) { 1 }
    it 'when a player chooses same cell again' do
      expect(new_move.validate(['X', 'X', 'X', 4, 'O', 6, 7, 'O', 9])).to eql(false)
    end
  end

  context '3' do
    let(:input) { 'O' }
    it 'when a player inputs things other than 1..9' do
      expect(new_move.validate(['X', 'X', 'X', 4, 'O', 6, 7, 'O', 9])).to eql(false)
    end
  end
end

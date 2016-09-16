require 'rails_helper'

RSpec.describe VideoGame, type: :model do
  describe "validity:" do

    it "is valid when contains title, release date, devloper, and publisher" do
      game = VideoGame.new(title: 'Final Fantasy', release_date: Date.strptime('2013-11-15', '%Y-%m-%d'), developer: 'SquareEnix', publisher: 'Sony')
      expect(game).to be_valid
    end

    it 'is not valid without a title' do
      game = VideoGame.new(release_date: Date.strptime('2013-11-15', '%Y-%m-%d') , developer: 'SquareEnix', publisher: 'Sony')
      game.valid?
      expect(game.errors[:title]).to include("can't be blank")
    end

    it 'is not valid without a release date' do
      game = VideoGame.new(title: 'Final Fantasy', developer: 'SquareEnix', publisher: 'Sony')
      game.valid?
      expect(game.errors[:release_date]).to include("can't be blank")
    end

    it 'is not valid without a developer' do
      game = VideoGame.new(title: 'Final Fantasy', release_date: Date.strptime('2013-11-15', '%Y-%m-%d'), publisher: 'Sony')
      game.valid?
      expect(game.errors[:developer]).to include("can't be blank")
    end

    it 'is not valid without a publisher' do
      game = VideoGame.new(title: 'Final Fantasy', release_date: Date.strptime('2013-11-15', '%Y-%m-%d'), developer: 'SquareEnix')
      game.valid?
      expect(game.errors[:publisher]).to include("can't be blank")
    end

    it 'is not valid with a review score that is not an integer between 0 and 100' do
      negative_score_game = VideoGame.new(title: 'Final Fantasy', release_date: Date.strptime('2013-11-15', '%Y-%m-%d'), developer: 'SquareEnix', publisher: 'Sony', review_score: -5)
      too_high_score_game = VideoGame.new(title: 'Final Fantasy', release_date: Date.strptime('2013-11-15', '%Y-%m-%d'), developer: 'SquareEnix', publisher: 'Sony', review_score: 101)
      non_integer_score_game = VideoGame.new(title: 'Final Fantasy', release_date: Date.strptime('2013-11-15', '%Y-%m-%d'), developer: 'SquareEnix', publisher: 'Sony', review_score: 88.4)

      negative_score_game.valid?
      expect(negative_score_game.errors[:review_score]).to include("must be greater than or equal to 0")

      too_high_score_game.valid?
      expect(too_high_score_game.errors[:review_score]).to include("must be less than or equal to 100")

      non_integer_score_game.valid?
      expect(non_integer_score_game.errors[:review_score]).to include("must be an integer")
    end
  end

  describe 'default values:' do
    it 'has a default series boolean value of false' do
      game = VideoGame.create(title: 'Final Fantasy', release_date: Date.strptime('2013-11-15', '%Y-%m-%d'), developer: 'SquareEnix', publisher: 'Sony')
      expect(game.series).to eq(false)
    end
  end

end

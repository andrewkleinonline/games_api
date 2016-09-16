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
      game = VideoGame.new(title: 'Final Fantasy', release_date: Date.strptime('2013-11-15', '%Y-%m-%d'), developer: 'SquareEnix', publisher: 'Sony')
      game.valid?
      expect(game.errors[:publisher]).to include("can't be blank")
    end
  end

end

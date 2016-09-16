require 'rails_helper'

RSpec.describe VideoGame, type: :model do
  describe "is not valid without column information" do
    it 'is not valid when missing title' do
      game = VideoGame.new(release_date: Date.strptime('2013-11-15', '%Y-%m-%d') , developer: 'SquareEnix', publisher: 'Sony')
      game.valid?
      expect(game.errors[:title]).to include("can't be blank")
    end

    it 'is not valid when missing release date' do
      game = VideoGame.new(title: 'Final Fantasy', developer: 'SquareEnix', publisher: 'Sony')
      game.valid?
      expect(game.errors[:release_date]).to include("can't be blank")
    end

    it 'is not valid when missing developer' do
      game = VideoGame.new(title: 'Final Fantasy', release_date: Date.strptime('2013-11-15', '%Y-%m-%d'), publisher: 'Sony')
      game.valid?
      expect(game.errors[:developer]).to include("can't be blank")
    end

    it "is valid when contains all required column information" do
      game = VideoGame.new(title: 'Final Fantasy', release_date: Date.strptime('2013-11-15', '%Y-%m-%d'), developer: 'SquareEnix')
      expect(game).to be_valid
    end

  end

end

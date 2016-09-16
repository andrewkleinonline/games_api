class Console < ApplicationRecord
  has_many :consoles_video_games
  has_many :video_games, through: :consoles_video_games
end

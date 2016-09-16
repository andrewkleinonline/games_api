class VideoGame < ApplicationRecord
  has_many :consoles_video_games
  has_many :consoles, through: :consoles_video_games
end

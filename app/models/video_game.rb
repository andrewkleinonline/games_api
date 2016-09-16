class VideoGame < ApplicationRecord
  has_many :consoles_video_games
  has_many :consoles, through: :consoles_video_games

  validates :title, :release_date, :developer, :publisher, presence: true
  validates :review_score, numericality: { allow_nil: true, only_integer: true,
    greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end

class ConsolesVideoGame < ApplicationRecord
  belongs_to :console
  belongs_to :video_game
end

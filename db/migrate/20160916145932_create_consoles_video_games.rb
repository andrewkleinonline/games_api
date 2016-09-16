class CreateConsolesVideoGames < ActiveRecord::Migration[5.0]
  def change
    create_table :consoles_video_games do |t|

      t.timestamps
    end
  end
end

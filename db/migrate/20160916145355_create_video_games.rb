class CreateVideoGames < ActiveRecord::Migration[5.0]
  def change
    create_table :video_games do |t|
      t.string :title
      t.date :release_date
      t.string :developer
      t.string :publisher
      t.string :genre
      t.boolean :series, default: false
      t.integer :review_score

      t.timestamps
    end
  end
end

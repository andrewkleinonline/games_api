class CreateVideoGameConsoleJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :video_games, :consoles
  end
end

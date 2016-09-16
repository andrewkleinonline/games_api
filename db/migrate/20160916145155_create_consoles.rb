class CreateConsoles < ActiveRecord::Migration[5.0]
  def change
    create_table :consoles do |t|
      t.string :name
      t.date :release_date
      t.string :manufacturer

      t.timestamps
    end
  end
end

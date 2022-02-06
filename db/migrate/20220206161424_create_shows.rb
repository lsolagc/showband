class CreateShows < ActiveRecord::Migration[6.1]
  def change
    create_table :shows do |t|
      t.string :venue
      t.string :venue_address
      t.datetime :start_time

      t.timestamps
    end

    create_join_table(:musics, :shows)
  end
end

class AddStatusToShows < ActiveRecord::Migration[6.1]
  def change
    add_column :shows, :status, :integer
  end
end

class ChangeRequestRequesterToUserAssociation < ActiveRecord::Migration[6.1]
  def change
    remove_column :requests, :requester, :string
    add_reference :requests, :requester
  end
end

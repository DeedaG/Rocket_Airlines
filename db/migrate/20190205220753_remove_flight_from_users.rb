class RemoveFlightFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :flight
  end
end

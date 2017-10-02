class RemoveDriverPassengerIdsFromTrips < ActiveRecord::Migration[5.1]
  def change
    remove_column :trips, :driver_id, :integer
    remove_column :trips, :passenger_id, :integer
  end
end

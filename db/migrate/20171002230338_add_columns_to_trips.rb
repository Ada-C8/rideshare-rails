class AddColumnsToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :driver_id, :integer
    add_column :trips, :passenger_id, :integer
    add_column :trips, :date, :date
    add_column :trips, :rating, :integer
    add_column :trips, :cost, :decimal
  end
end

class RemoveCostFromTrips < ActiveRecord::Migration[5.1]
  def change
    remove_column(:trips, :cost)
  end
end

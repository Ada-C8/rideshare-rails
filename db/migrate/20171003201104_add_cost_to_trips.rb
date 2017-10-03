class AddCostToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column(:trips, :cost, :Integer)
  end
end

class AddCostToTripsAsDecimal < ActiveRecord::Migration[5.1]
  def change
    add_column(:trips, :cost, :decimal)
  end
end

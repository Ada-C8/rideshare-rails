class AddPassIdToTrips < ActiveRecord::Migration[5.1]
  def change
    add_reference :trips, :passenger, foreign_key: true
  end
end

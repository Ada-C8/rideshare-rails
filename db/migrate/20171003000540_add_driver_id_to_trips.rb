class AddDriverIdToTrips < ActiveRecord::Migration[5.1]
  def change
    add_reference :trips, :driver, foreign_key: true
  end
end

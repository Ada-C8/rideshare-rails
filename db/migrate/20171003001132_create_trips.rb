class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.date :date
      t.float :rating
      t.float :cost
      t.integer :driver_id
      t.integer :passenger_id

      t.timestamps
    end
  end
end

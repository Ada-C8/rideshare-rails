class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :date
      t.integer :rating
      t.decimal :cost

      t.timestamps
    end
  end
end

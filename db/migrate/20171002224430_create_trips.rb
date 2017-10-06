class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.belongs_to :driver, index: true
      t.belongs_to :passenger, index: true
      t.date :date
      t.integer :rating
      t.integer :cost

      t.timestamps
    end
  end
end

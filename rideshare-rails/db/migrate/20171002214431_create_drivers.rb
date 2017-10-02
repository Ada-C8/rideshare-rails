class CreateDrivers < ActiveRecord::Migration[5.1]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :car_vin

      t.timestamps
    end
  end
end

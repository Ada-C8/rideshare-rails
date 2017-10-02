class ChangeTripRatingToRate < ActiveRecord::Migration[5.1]
  def change
    remove_column :trips, :rate
    add_column :trips, :rating, :integer
  end
end

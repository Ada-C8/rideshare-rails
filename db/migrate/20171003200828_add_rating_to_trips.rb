class AddRatingToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column(:trips, :rating, :Integer)
  end
end

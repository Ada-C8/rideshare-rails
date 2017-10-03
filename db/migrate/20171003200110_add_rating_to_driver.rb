class AddRatingToDriver < ActiveRecord::Migration[5.1]
  def change
    add_column(:drivers, :rating, :Integer)
  end
end

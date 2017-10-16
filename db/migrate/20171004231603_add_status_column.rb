class AddStatusColumn < ActiveRecord::Migration[5.1]
  def change
    add_column(:drivers, :status, :boolean)
  end
end

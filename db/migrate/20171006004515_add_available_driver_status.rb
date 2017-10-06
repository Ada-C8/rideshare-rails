class AddAvailableDriverStatus < ActiveRecord::Migration[5.0]
  def change
    add_column :drivers, :available, :boolean, :default => true
  end
end

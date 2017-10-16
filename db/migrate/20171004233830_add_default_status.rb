class AddDefaultStatus < ActiveRecord::Migration[5.1]
  def change
    change_column :drivers, :status, :boolean, :default => false
  end
end

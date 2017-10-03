class ChangeVimToVin < ActiveRecord::Migration[5.1]
  def change
    rename_column(:drivers, :vim, :vin)
  end
end

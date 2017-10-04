class SetDefaultValueForExistingDrivers < ActiveRecord::Migration[5.1]
  def up
    Driver.where(status: nil).update_all(status: false)
  end
  def down
    Driver.where(status: false).update_all(status: nil)
  end
end

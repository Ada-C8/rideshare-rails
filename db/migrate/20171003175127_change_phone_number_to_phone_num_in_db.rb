class ChangePhoneNumberToPhoneNumInDb < ActiveRecord::Migration[5.1]
  def change
    rename_column(:passengers, :phone_number, :phone_num)
  end
end

class ChangePhoneNumberColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :passengers, :phonenumber
    add_column :passengers, :phone_num, :string 
  end
end

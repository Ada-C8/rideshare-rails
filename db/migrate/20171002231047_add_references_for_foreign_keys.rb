class AddReferencesForForeignKeys < ActiveRecord::Migration[5.1]
  def change
    add_reference :trips, :driver, foreign_key: true
    add_reference :trips, :rider, foreign_key: true
  end
end

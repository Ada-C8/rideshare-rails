class AddDriverToTrips < ActiveRecord::Migration[5.1]
  def change
  # add_reference :trips, :driver, foreign_key: true
  # don't need this migration because I already made this connection. I thought that the connection between tables wasn't working, so I tried this but when I ran db:migrate it threw an error because this connection is already established in the db! 
  end
end

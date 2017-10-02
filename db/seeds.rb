require 'csv'

DRIVER_FILE = Rails.root.join('db', 'seed_data', 'drivers.csv')
puts "Loading raw driver data from #{DRIVER_FILE}"

driver_failures = []
CSV.foreach(DRIVER_FILE, :headers => true) do |row|
  driver = Driver.new
  driver.id = row['id']
  driver.name = row['name']
  driver.vin = row['vin']
  puts "Created driver: #{driver.inspect}"
  successful = driver.save
  if !successful
    driver_failures << driver
  end
end

puts "Added #{Driver.count} driver records"
puts "#{driver_failures.length} drivers failed to save"



RIDER_FILE = Rails.root.join('db', 'seed_data', 'passengers.csv')
puts "Loading raw rider data from #{RIDER_FILE}"

rider_failures = []
CSV.foreach(RIDER_FILE, :headers => true) do |row|
  rider = Rider.new
  rider.id = row['id']
  rider.name = row['name']
  rider.phone = row['phone_num']
  puts "Created rider: #{rider.inspect}"
  successful = rider.save
  if !successful
    rider_failures << rider
  end
end

puts "Added #{Rider.count} rider records"
puts "#{rider_failures.length} riders failed to save"



TRIP_FILE = Rails.root.join('db', 'seed_data', 'trips.csv')
puts "Loading raw trip data from #{TRIP_FILE}"

trip_failures = []
CSV.foreach(TRIP_FILE, :headers => true) do |row|
  trip = Trip.new
  trip.id = row['id']
  trip.driver_id = row['driver_id']
  trip.rider_id = row['passenger_id']
  trip.date = Date.strptime(row['date'], '%Y-%m-%d')
  trip.rating = row['rating']
  trip.cost = row['cost']
  puts "Created trip: #{trip.inspect}"
  successful = trip.save
  if !successful
    trip_failures << trip
  end
end

puts "Added #{Trip.count} trip records"
puts "#{trip_failures.length} trips failed to save"


# Since we set the primary key (the ID) manually on each of the
# tables, we've got to tell postgres to reload the latest ID
# values. Otherwise when we create a new record it will try
# to start at ID 1, which will be a conflict.
puts "Manually resetting PK sequence on each table"
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

puts "done"

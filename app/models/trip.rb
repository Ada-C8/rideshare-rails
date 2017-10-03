class Trip < ApplicationRecord
  has_one :passenger
  has_one :driver
 
end

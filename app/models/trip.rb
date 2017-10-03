class Trip < ApplicationRecord
  has_one :passenger
  has_one :driver

 #need validations once we know what is going on
end

class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger
  validates_presence_of :date
  validates_presence_of :driver, message: "No Drivers Available. Please try again later"
end

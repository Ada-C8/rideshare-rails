class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :rider

  validates_presence_of :driver, :rider, :cost, :date

  def needs_rating?
    return true if self.rating == 0
  end
end

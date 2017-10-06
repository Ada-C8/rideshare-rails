class Trip < ApplicationRecord
  belongs_to :driver

  belongs_to :passenger, optional: true

  validates :rating, numericality: { only_integer: true, allow_nil: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 0, message: "Rating must be a number between 0-5." }
  # use self because we are addressing behavior not attribute. The trip object is passed into the function and then the cost is returned.
  def self.total_cost(input)
      total = input.cost/100
      return "%.2f"%total
  end

  def self.total_cost(input)
    total = input.cost/100
    return "%.2f"%total
  end

  def self.grand_total(total_cost)
    final_total_cost = total_cost/100
    return "%.2f"%final_total_cost
  end

  def self.total_earning(trip)
    total = ((trip.cost - (trip.cost * 0.15)) / 100)
    return "%.2f"%total
  end


    # def self.grand_total(total_cost)
    #   final_total_cost = total_cost/100
    #
    #   return "%.2f"%final_total_cost
    # end

    def self.total_earning(trip)
      total = ((trip.cost - (trip.cost * 0.15)) /100)
       return "%.2f"%total
    end
end

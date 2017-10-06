class Trip < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver

  #if calling .name raises an error, return "Deactivated"
  #

  def driver_name
    if driver.nil?
      return "Deactivated"
    else
      return driver.name
    end
  end

  def driver_id
    if driver.nil?
      return "Deactivated"
    else
      return driver.id
    end
  end

  def passenger_name
    if passenger.nil?
      return "Deactivated"
    else
      return passenger.name
    end
  end


  def passenger_id
    if passenger.nil?
      return "Deactivated"
    else
      return passenger.id
    end
  end



  def cost_convert
    "%.2f" % (cost / 100.0)
  end


end

class Trip < ApplicationRecord
  belongs_to :driver

  belongs_to :passenger, optional: true

end

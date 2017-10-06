class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  validates :date, presence: true
  validates :cost, presence: true, numericality: {only_integer: true}
  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5  }, :allow_nil => true


  def to_cents
    return self.cost.to_i * 100
  end

  def to_dollars
    return '%.2f' % (self.cost.to_f / 100.0 )
  end
end

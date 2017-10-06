module ApplicationHelper
  def set_class(rating)
    case rating
      when 0
       "zero-stars"
      when 1
       "one-star"
      when 2
       "two-stars"
      when 3
       "three-stars"
      when 4
       "four-stars"
      when 5
       "five-stars"
    end
  end
end

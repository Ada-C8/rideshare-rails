module ApplicationHelper
  def money_format(input)
    if !input
      return "Incomplete Trip"
    end
    input = input.to_s
    if input[-1] == "0"
      return "$#{input}0"
    else
      return "$#{input}"
    end
  end
  def rating_format(input)
    if !input
      return "Incomplete Rating"
    else
      return input
    end
  end
end

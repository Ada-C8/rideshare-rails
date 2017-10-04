module ApplicationHelper
  def money_format(input)
    input = input.to_s
    if input[-1] == "0"
      return "$#{input}0"
    else
      return "$#{input}"
    end
  end
end

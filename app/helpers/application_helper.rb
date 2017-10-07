module ApplicationHelper
  def toggle_sort(column_name)
    css_class = column_name == sort_column ? "current #{sort_direction}" : nil
    direction = (column_name == sort_column && sort_direction == "DESC") ? "ASC" : "DESC"

    link_to column_name, { :sort => column_name, :direction => direction }, { :class => css_class }
  end
end

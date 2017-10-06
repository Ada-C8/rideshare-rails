module ApplicationHelper
  def toggle_sort(column_name)
    direction = column_name == params[:sort] && params[:direction] == "DESC" ? "ASC" : "DESC"

    link_to column_name, :sort => column_name, :direction => direction
  end
end

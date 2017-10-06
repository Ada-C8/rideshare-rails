module ApplicationHelper
  def toggle_sort(column_name)
    sort_type = column_name == params[:sort] && params[:sort_type] == "DESC" ? "ASC" : "DESC"

    link_to column_name, :sort => column_name, :sort_type => sort_type
  end
end

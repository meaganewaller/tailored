module ApplicationHelper
  include Pagy::Frontend

  # Returns 'active' class if the column is currently being sorted
  def active_sort?(column)
    params[:sort] == column.to_s ? 'bg-primary-200' : ''
  end
end

# frozen_string_literal: true

# General use helpers for views
module ApplicationHelper
  include Pagy::Frontend

  # Returns 'active' class if the column is currently being sorted
  def active_sort?(column)
    params[:sort] == column.to_s ? 'bg-rose-200' : ''
  end

  # Returns the empty state display, for use on index pages mostly
  def empty_state(title, subtitle: nil, path: nil, &block)
    render 'application/empty_state', title:, subtitle:, path:, &block
  end
end

# frozen_string_literal: true

# The root page for users is the show action
class DashboardController < ApplicationController
  def show
    @wardrobe_items = WardrobeItem.all
    @total_items = @wardrobe_items.count
    @total_outfits = Outfit.all.count
    @top_categories = find_top_categories
    @outfit_suggestions = generate_outfit_suggestions
    @top_colors = find_top_colors
  end

  private

  def generate_outfit_suggestions
    [Outfit.all.sample]
  end

  def find_top_categories
    @wardrobe_items.where.not(category_id: nil).group(:category).count.sort_by { |_, count| -count }.first(3)
  end

  def find_top_colors
    # TODO: Find all top colors, for now I'm just using the colors of a random wardrobe item
    @top_colors = WardrobeItem.find(432).colors.first(5)
  end
end

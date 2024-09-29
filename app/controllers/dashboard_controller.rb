class DashboardController < ApplicationController
  def show
    @wardrobe_items = WardrobeItem.all.limit(3)
    @total_items = WardrobeItem.count
    # @top_categories = WardrobeItem.all.group(:category).count.sort_by { |_, count| -count }.first(3)

    @outfit_suggestions = generate_outfit_suggestions
  end

  private

  def generate_outfit_suggestions
    [Outfit.all.sample]
  end
end

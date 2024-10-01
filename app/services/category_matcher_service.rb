# frozen_string_literal: true

class CategoryMatcherService
  def initialize(tags)
    @tags = tags.map(&:downcase)
    @potential_categories = Hash.new { |hash, key| hash[key] = [] }
  end

  def infer_categories
    global_categories = Category.global

    @tags.each do |tag|
      global_categories.each do |category|
        if category.subcategories.any? { |subcat| matches_singular_or_plural?(subcat.name, tag) }
          @potential_categories[category] << tag unless @potential_categories[category].include?(tag)
        elsif matches_singular_or_plural?(category.name, tag)
          @potential_categories[category] ||= []
        end
      end
    end

    found_category, found_subcategories = @potential_categories.max_by { |_, subcats| subcats.size }

    return {category: nil, subcategories: []} unless found_category

    {category: found_category, subcategories: found_subcategories}
  end

  private

  # Helper method to check if a tag matches either the singular or plural form of a name
  def matches_singular_or_plural?(category_name, tag)
    tag == category_name.downcase.singularize || tag == category_name.downcase.pluralize
  end
end

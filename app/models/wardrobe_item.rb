require 'pry'
class WardrobeItem < ApplicationRecord
  acts_as_tenant :account

  broadcasts_refreshes

  has_and_belongs_to_many :outfits

  has_many_attached :images

  before_save :set_categories, if: :will_save_change_to_tags?
  before_validation :set_default_name, on: :create
  before_validation :set_default_values

  validate :colors_must_be_valid_json
  validates :cost, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  private

  def set_default_values
    self.season ||= "All Season"
    self.occasions ||= []
  end

  def set_default_name
    if self.name.blank?
      self.name = "Wardrobe Item ##{WardrobeItem.maximum(:id).to_i + 1}"
    end
  end

  def colors_must_be_valid_json
    return true if self.colors.empty?
    self.colors.each do |color|
      if color.is_a?(Hash)
        unless valid_hex?(color["hex"]) && color["score"].is_a?(Numeric)
          errors.add(:colors, "Each color must have a valid hex value and score.")
        end
      else
        errors.add(:colors, 'must be a valid JSON object')
      end
    end
  end

  def valid_hex?(hex)
    hex.present? && hex.match(/\A#[0-9a-fA-F]{6}\z/)
  end

  def set_categories
    return if tags.blank?

    infer_categories
  end

  def infer_categories
    potential_categories = {}

    # INFO: Step 1: Iterate through tags to gather category/subcategory pairs
    tags.each do |tag|
      WARDROBE_ITEMS_CATEGORIES.each do |cat, subcats|
        if subcats.include?(tag.downcase)
          # Accumulate potential categories and their subcategories
          potential_categories[cat] ||= [] # Initialize if not present
          potential_categories[cat] << tag unless potential_categories[cat].include?(tag) # Avoid duplicates
        elsif cat == tag.downcase
          # If the tag directly matches a category key, add it with an empty subcategory list
          potential_categories[cat] ||= []
        end
      end
    end

    # INFO: Step 2: Pick the best category (one with the most subcategories)
    found_category, found_subcategories = potential_categories.max_by { |_, subcats| subcats.size }

    # Return unless a category is found
    return unless found_category

    self.category = found_category.capitalize
    self.subcategories = found_subcategories.map(&:capitalize)
  end
end

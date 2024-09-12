class Outfit < ApplicationRecord
  acts_as_tenant :account
  broadcasts_refreshes

  has_and_belongs_to_many :wardrobe_items
  has_and_belongs_to_many :wishlist_items, optional: true

  validates :name, presence: true
end

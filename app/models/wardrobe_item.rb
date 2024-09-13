class WardrobeItem < ApplicationRecord
  acts_as_tenant :account

  broadcasts_refreshes

  has_and_belongs_to_many :outfits

  has_many_attached :images
end

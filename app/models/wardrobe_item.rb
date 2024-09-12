class WardrobeItem < ApplicationRecord
  acts_as_tenant :account

  broadcasts_refreshes
  belongs_to :account
end

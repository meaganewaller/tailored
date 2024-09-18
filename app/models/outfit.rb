class Outfit < ApplicationRecord
  acts_as_tenant :account

  broadcasts_refreshes

  has_and_belongs_to_many :wardrobe_items
  has_many_attached :images

  validates :name, presence: true

  before_validation :set_default_name, on: :create

  private

  def set_default_name
    if name.blank?
      self.name = "Outfit ##{Outfit.where(account_id: account.id).maximum(:id).to_i + 1}"
    end
  end
end

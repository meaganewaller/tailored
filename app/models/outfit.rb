# == Schema Information
#
# Table name: outfits
#
#  id            :bigint           not null, primary key
#  category      :string
#  name          :string
#  occasion      :string
#  occasions     :string           default([]), is an Array
#  rating        :integer
#  season        :string
#  subcategories :jsonb            not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  account_id    :bigint           not null
#
# Indexes
#
#  index_outfits_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
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

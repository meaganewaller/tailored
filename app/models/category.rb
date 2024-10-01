# == Schema Information
#
# Table name: categories
#
#  id              :bigint           not null, primary key
#  global          :boolean          default(FALSE), not null
#  metadata_schema :jsonb
#  name            :citext           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  account_id      :bigint
#  parent_id       :bigint
#
# Indexes
#
#  index_categories_on_account_id           (account_id)
#  index_categories_on_account_id_and_name  (account_id,name) UNIQUE
#  index_categories_on_parent_id            (parent_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (parent_id => categories.id)
#
class Category < ApplicationRecord
  belongs_to :account, optional: true
  belongs_to :parent, class_name: "Category", optional: true
  has_many :subcategories, class_name: "Category", foreign_key: "parent_id", dependent: :destroy

  has_many :wardrobe_items

  validates :name, presence: true
  validates :name, uniqueness: {scope: [:account_id, :global], message: I18n.t("categories.errors.unique_validation")}

  scope :global, -> { where(global: true) }
  scope :account_specific, ->(account) { where(account: account, global: false) }
  scope :top_level, -> { where(parent_id: nil) }
end

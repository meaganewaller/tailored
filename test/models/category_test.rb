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
require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

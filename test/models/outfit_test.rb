# == Schema Information
#
# Table name: outfits
#
#  id         :bigint           not null, primary key
#  name       :string
#  occasion   :string
#  occasions  :string           default([]), is an Array
#  rating     :integer
#  season     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :bigint           not null
#
# Indexes
#
#  index_outfits_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
require "test_helper"

class OutfitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

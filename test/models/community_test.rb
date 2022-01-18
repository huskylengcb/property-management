# == Schema Information
#
# Table name: communities
#
#  id             :integer          not null, primary key
#  name           :string
#  adress         :string
#  phone          :string
#  verified_state :integer          default("0")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require "test_helper"

class CommunityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

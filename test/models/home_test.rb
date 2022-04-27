# == Schema Information
#
# Table name: homes
#
#  id         :integer          not null, primary key
#  number     :string
#  tower_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

class HomeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

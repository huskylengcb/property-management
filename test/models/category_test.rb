# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  type        :string
#  logo        :string
#  name        :string
#  position    :integer
#  items_count :integer
#  state       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

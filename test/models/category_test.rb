# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  items_count :integer
#  logo        :string
#  name        :string
#  position    :integer
#  state       :integer
#  type        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  parent_id   :integer
#

require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

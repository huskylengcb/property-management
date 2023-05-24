# == Schema Information
#
# Table name: adverts
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  phone       :string
#  position    :integer
#  show_type   :integer
#  state       :integer
#  wechat      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  user_id     :integer
#
require "test_helper"

class AdvertTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

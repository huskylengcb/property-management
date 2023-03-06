# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  avatarUrl       :string
#  gender          :integer
#  login_name      :string
#  nickname        :string
#  password_digest :string
#  phone           :string
#  role            :integer
#  type            :string
#  unionid         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  open_id         :string
#

require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

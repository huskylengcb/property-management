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

class User < ApplicationRecord
  has_secure_password validations: false

  def detail_builder
    Jbuilder.new do |json|
      json.(self, :id, :nickname, :avatarUrl, :gender, :phone)
    end.attributes!
  end
end

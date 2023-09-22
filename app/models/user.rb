# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  avatar_url      :string
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
      json.(self, :id, :nickname, :avatar_url, :gender, :phone)
    end.attributes!
  end

  def self.ransackable_attributes(auth_object = nil)
    ["nickname"]
  end

  def self.generate_nickname
  end

  def detail_builder
    Jbuilder.new do |json|
      json.(self, :id, :avatar_url, :phone)
      json.nickname self.nickname || "微信用户"
    end.attributes!
  end
end

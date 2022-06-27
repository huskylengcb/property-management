# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  nickname   :string
#  avatarUrl  :string
#  gender     :integer
#  phone      :string
#  open_id    :string
#  unionid    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord

  def detail_builder
    Jbuilder.new do |json|
      json.(self, :id, :nickname, :avatarUrl, :gender, :phone)
    end.attributes!
  end

end

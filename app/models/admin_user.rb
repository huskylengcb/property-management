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
class AdminUser < User
  validates :login_name, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true, length: {in: 6..16, allow_blank: true}

  scope :sorted, ->{ order('users.id desc') }

  def self.ransackable_attributes(auth_object = nil)
    ["login_name"]
  end
end

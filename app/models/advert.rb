# == Schema Information
#
# Table name: adverts
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  phone       :string
#  state       :integer
#  wechat      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  user_id     :integer
#
class Advert < ApplicationRecord
  validates :name, :category_id, presence: true
  validates :name, :length => { :maximum => 20 }

  enum state: { normal: 0 }

  belongs_to :category, class_name: 'Category::AdvertCategory', foreign_key: :category_id

  after_initialize do
    self.state = 0 if state.blank?
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end

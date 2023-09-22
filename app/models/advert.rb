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
class Advert < ApplicationRecord
  validates :name, :category_id, presence: true
  validates :name, :length => { :maximum => 20 }

  enum state: { visible: 0, hidden: 1 }
  enum show_type: { ordinary: 0, carousel: 1 }

  acts_as_list column: :position

  include HasAsset
  has_one_asset :image, class_name: 'Asset::AdvertImage'

  belongs_to :category, class_name: 'Category::AdvertCategory', foreign_key: :category_id
  belongs_to :user

  scope :sorted, -> { order(position: :desc) }

  after_initialize do
    self.state = :visiable if state.blank?
    self.show_type = :ordinary if show_type.blank?
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end

  def detail_builder
    Jbuilder.new do |json|
      json.(self, :id, :name, :description, :phone, :wechat, :state, :user_id, :category_id)
      json.created_at self.created_at.strftime("%Y-%m-%d %H:%M")
      json.updated_at self.updated_at.strftime("%Y-%m-%d %H:%M")
      json.user self.user.detail_builder
      json.image_url self.image_url(:tiny).try(:url)
    end.attributes!
  end
end

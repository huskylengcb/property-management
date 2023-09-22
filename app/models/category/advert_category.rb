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
class Category::AdvertCategory < Category

  has_many :adverts, foreign_key: "category_id", dependent: :restrict_with_error

  def self.human_name
    '广告类型'
  end
end

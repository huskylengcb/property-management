# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  type        :string
#  logo        :string
#  name        :string
#  position    :integer
#  items_count :integer
#  state       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Category::AdvertCategory < Category

  has_many :adverts, foreign_key: "category_id", dependent: :restrict_with_error

  def self.human_name
    '广告类型'
  end
end

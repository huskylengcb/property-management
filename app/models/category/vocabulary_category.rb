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
class Category::VocabularyCategory < Category

  has_many :vocabularies, dependent: :restrict_with_error

  def self.human_name
    '词汇类型'
  end
end

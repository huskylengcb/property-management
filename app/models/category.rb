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

class Category < ApplicationRecord
  # include R18n::Translated
  # translations :name

  # enum state: {visible: 1, hidden: 2}
  # default_value_for :state, :visible

  acts_as_list scope: [:type], column: :position

  scope :default, -> {order('position asc')}

  validates :name, presence: true

  belongs_to :parent, class_name: "Category", foreign_key: "parent_id", optional: true
  has_many :children, class_name: "Category", foreign_key: "parent_id"

  def self.types
    # ['AdvertCategory']
    ['VocabularyCategory'].freeze
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end

  def self.options_for_select
    self.all.map{|c| [c.name, c.id]}
  end

  def self.parent_options_for_select
    self.where(parent_id: nil).map{|c| [c.name, c.id]}
  end

  def detail_builder
    Jbuilder.new do |json|
      json.(self, :id, :name, :type)
      json.children self.children.map{|c| c.detail_builder} if self.parent_id.nil?
    end.attributes!
  end
end

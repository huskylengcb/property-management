# == Schema Information
#
# Table name: vocabularies
#
#  id                     :bigint           not null, primary key
#  chinese                :string
#  english                :string
#  grade                  :string
#  unit                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  vocabulary_category_id :integer
#
class Vocabulary < ApplicationRecord

  validates :chinese, :english, :vocabulary_category_id, presence: true

  belongs_to :vocabulary_category, class_name: 'Category::VocabularyCategory', foreign_key: :vocabulary_category_id

  scope :sorted, -> { order(created_at: :desc) }

  def self.units
    (1..12).map{|i| "Unit #{i}"}.freeze
  end

  def self.grades
    ["七年级上","七年级下", "八年级上", "八年级下", "九年级上",  "九年级下"].freeze
  end

  def self.ransackable_attributes(auth_object = nil)
    ["chinese", "created_at", "english", "grade", "id", "unit", "updated_at", "vocabulary_category_id"]
  end

  def simple_builder
    Jbuilder.new do |json|
      json.(self, :id, :chinese, :english)
    end.attributes!
  end
end

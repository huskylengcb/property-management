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

class Category < ApplicationRecord
  # include R18n::Translated
  # translations :name
  
  # enum state: {visible: 1, hidden: 2}
  # default_value_for :state, :visible

  acts_as_list scope: [:type], column: :position

  scope :default, -> {order('position asc')}

  validates :name, presence: true

  def self.types
    ['AdvertCategory']
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end

  def self.options_for_select
    self.all.map{|c| [c.name, c.id]}
  end
end

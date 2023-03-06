# == Schema Information
#
# Table name: towers
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tower < ApplicationRecord
  validates :name, uniqueness: true

  has_many :homes, dependent: :restrict_with_error

  def self.options_for_select
    self.all.map{|c| [c.name, c.id]}
  end
end

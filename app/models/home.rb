# == Schema Information
#
# Table name: homes
#
#  id         :integer          not null, primary key
#  number     :string
#  tower_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Home < ApplicationRecord
  validates :number, uniqueness: { scope: :tower_id }
  validates :number, presence: true

  belongs_to :tower
end

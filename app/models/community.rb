# == Schema Information
#
# Table name: communities
#
#  id             :integer          not null, primary key
#  name           :string
#  adress         :string
#  phone          :string
#  verified_state :integer          default("0")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Community < ApplicationRecord
  validates :name, :adress, presence: true

  enum verified_state: { not_verified: 0, applying: 1, verified: 2}
end

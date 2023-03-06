# == Schema Information
#
# Table name: communities
#
#  id             :bigint           not null, primary key
#  name           :string
#  address        :string
#  phone          :string
#  verified_state :integer          default("unverified")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Community < ApplicationRecord
  validates :name, :address, presence: true

  enum verified_state: { unverified: 0, applying: 1, verified: 2}

  scope :sorted, -> { order('communities.created_at desc') }

  def detail_builder
    Jbuilder.new do |json|
      json.(self, :id, :name, :address, :phone)
      json.created_at self.created_at.strftime("%Y-%m-%d %H:%M")
    end.attributes!
  end
end

# == Schema Information
#
# Table name: assets
#
#  id            :integer          not null, primary key
#  type          :string
#  owner_type    :string
#  owner_id      :integer
#  position      :integer
#  file          :string
#  file_name     :string
#  file_size     :integer
#  protect_token :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Asset < ApplicationRecord
  acts_as_list scope: [:owner_type, :owner_id], column: :position

  validates :file, presence: true

  belongs_to :owner, polymorphic: true

  belongs_to :user

  mount_uploader :file, AssetUploader

  before_validation :get_file_info
  before_create :generate_token

  def get_file_info
    return if self.file.file.blank?
    self.file_name = self.file.file.filename.to_s
    self.file_size = self.file.size
    if self.file.content_type.start_with? 'image/'
      self.width, self.height = ::MiniMagick::Image.open(file.file.path)[:dimensions]
    end
  end

  def generate_token
    self.protect_token = SecureRandom.hex(10)
  end
end

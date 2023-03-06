# == Schema Information
#
# Table name: assets
#
#  id                       :bigint           not null, primary key
#  file(附件)               :string
#  file_name(文件名)        :string
#  file_size(文件大小)      :integer
#  height                   :integer
#  owner_type(所属对象)     :string
#  position(排序)           :integer
#  protect_token(删除token) :string
#  type(类别（单表继承）)   :string
#  user_type(所属用户类型)  :string
#  width                    :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  owner_id(所属对象id)     :integer
#  user_id(所属用户id)      :integer
#
# Indexes
#
#  index_assets_on_owner_type_and_owner_id  (owner_type,owner_id)
#  index_assets_on_position                 (position)
#  index_assets_on_type                     (type)
#

class Asset < ApplicationRecord
  acts_as_list scope: [:owner_type, :owner_id], column: :position

  validates :file, presence: true

  belongs_to :owner, polymorphic: true, optional: true

  belongs_to :user, optional: true

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

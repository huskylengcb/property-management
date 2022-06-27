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
#  user_type     :string
#  user_id       :integer
#  protect_token :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Asset::FeedbackImage < Asset

  mount_uploader :file, FeedbackImageUploader

end

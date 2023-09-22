# == Schema Information
#
# Table name: vocabulary_dictation_logs
#
#  id         :bigint           not null, primary key
#  right      :jsonb
#  wrong      :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class VocabularyDictationLog < ApplicationRecord

  belongs_to :user

  def to_builder
    Jbuilder.new do |json|
      json.(self, :id, :right, :wrong)
      json.created_at self.created_at.strftime("%Y-%m-%d %H:%M")
      json.updated_at self.updated_at.strftime("%Y-%m-%d %H:%M")
    end.attributes!
  end
end

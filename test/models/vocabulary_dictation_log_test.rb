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
require "test_helper"

class VocabularyDictationLogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

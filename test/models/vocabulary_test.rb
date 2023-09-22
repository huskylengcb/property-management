# == Schema Information
#
# Table name: vocabularies
#
#  id                     :bigint           not null, primary key
#  chinese                :string
#  english                :string
#  grade                  :string
#  unit                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  vocabulary_category_id :integer
#
require "test_helper"

class VocabularyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

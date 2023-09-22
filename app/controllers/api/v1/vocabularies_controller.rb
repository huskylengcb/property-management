class Api::V1::VocabulariesController < Api::V1::BaseController
  def index
    a = Time.now
    search = Vocabulary.where(unit: params[:unit], grade: params[:grade])

    words = search.where(vocabulary_category_id: Category::VocabularyCategory.find_by(name: "单词"))
    phrases = search.where(vocabulary_category_id: Category::VocabularyCategory.find_by(name: "短语"))
    partterns = search.where(vocabulary_category_id: Category::VocabularyCategory.find_by(name: "句型搭配"))
    puts Time.now - a
    api_success(
      message: '请求成功',
      data: {
        words: to_builder(words),
        phrases: to_builder(phrases),
        partterns: to_builder(partterns)
      }
    )
  end

  private
  def to_builder(vocabularies)
    vocabularies.map { |vocabulary| vocabulary.simple_builder }
  end
end

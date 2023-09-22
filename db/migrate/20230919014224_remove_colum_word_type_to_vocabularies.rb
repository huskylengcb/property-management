class RemoveColumWordTypeToVocabularies < ActiveRecord::Migration[7.0]
  def change
    remove_column :vocabularies, :word_type, :string
  end
end

class CreateVocabularies < ActiveRecord::Migration[7.0]
  def change
    create_table :vocabularies do |t|
      t.string :unit
      t.string :grade
      t.string :english
      t.string :chinese
      t.integer :vocabulary_category_id
      t.string :word_type

      t.timestamps
    end
  end
end

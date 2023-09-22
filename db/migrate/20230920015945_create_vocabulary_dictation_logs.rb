class CreateVocabularyDictationLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :vocabulary_dictation_logs do |t|
      t.integer :user_id
      t.jsonb :right
      t.jsonb :wrong

      t.timestamps
    end
  end
end

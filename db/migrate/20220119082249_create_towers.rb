class CreateTowers < ActiveRecord::Migration[7.0]
  def change
    create_table :towers do |t|
      t.string :name

      t.timestamps
    end
  end
end

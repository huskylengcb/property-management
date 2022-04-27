class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :type
      t.string :logo
      t.string :name
      t.integer :position
      t.integer :items_count
      t.integer :state

      t.timestamps
    end
  end
end

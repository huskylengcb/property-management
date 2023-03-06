class CreateAdverts < ActiveRecord::Migration[7.0]
  def change
    create_table :adverts do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.string :phone
      t.string :wechat
      t.integer :user_id
      t.integer :state

      t.timestamps
    end
  end
end

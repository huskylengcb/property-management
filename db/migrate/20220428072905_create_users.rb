class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :avatarUrl
      t.integer :gender
      t.string :phone
      t.string :open_id
      t.string :unionid

      t.timestamps
    end
  end
end

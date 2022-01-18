class CreateCommunities < ActiveRecord::Migration[7.0]
  def change
    create_table :communities do |t|
      t.string :name
      t.string :adress
      t.string :phone
      t.integer :verified_state, :default =>  0

      t.timestamps
    end
  end
end

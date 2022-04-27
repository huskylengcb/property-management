class CreateHomes < ActiveRecord::Migration[7.0]
  def change
    create_table :homes do |t|
      t.string :number
      t.integer :tower_id

      t.timestamps
    end
  end
end

class AddPositionToAdverts < ActiveRecord::Migration[7.0]
  def change
    add_column :adverts, :position, :integer
    add_column :adverts, :show_type, :integer
  end
end

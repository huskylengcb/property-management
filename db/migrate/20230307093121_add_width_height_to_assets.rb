class AddWidthHeightToAssets < ActiveRecord::Migration[7.0]
  def change
    add_column :assets, :width, :integer
    add_column :assets, :height, :integer
  end
end

class RenameColumnAddressToCommunity < ActiveRecord::Migration[7.0]
  def change
  	rename_column(:communities, :adress, :address)
  end
end

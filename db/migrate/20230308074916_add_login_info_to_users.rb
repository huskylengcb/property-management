class AddLoginInfoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :login_name, :string
    add_column :users, :password_digest, :string
    add_column :users, :role, :integer
    add_column :users, :type, :string
  end
end

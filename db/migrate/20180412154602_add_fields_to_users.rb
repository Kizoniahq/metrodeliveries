class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :addrress, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :avatar, :string
  end
end

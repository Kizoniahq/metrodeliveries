class AddTrackingNumberToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :tracking, :string
  end
end

class AddDeliveryStatusToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :delivery_status, :string
  end
end

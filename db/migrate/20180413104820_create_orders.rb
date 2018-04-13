class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :type
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.boolean :paid
      t.string :shipment_fee
      t.integer :weight
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

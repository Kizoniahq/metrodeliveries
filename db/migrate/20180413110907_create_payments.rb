class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.string :amount
      t.string :first_name
      t.string :last_name
      t.string :payment_method
      t.integer :order_id
      t.integer :user_id
      t.string :email

      t.timestamps
    end
  end
end

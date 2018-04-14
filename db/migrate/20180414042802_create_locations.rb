class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :location
      t.string :status
      t.integer :order_id
      t.integer :user_id

      t.timestamps
    end
  end
end

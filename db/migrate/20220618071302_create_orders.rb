class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :user_id
      t.string :postal_code
      t.text :delivery_address
      t.string :method_of_payment
      t.integer :status
      t.integer :total_price
      t.integer :delivery_charge

      t.timestamps
    end
  end
end
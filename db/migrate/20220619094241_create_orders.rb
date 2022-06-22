class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :public_id
      t.string  :postal_code
      t.text    :delivery_address
      t.string  :delivery_name
      t.integer :method_of_payment, default: "0"
      t.integer :status,            default: "0"
      t.integer :total_price
      t.integer :delivery_charge

      t.timestamps
    end
  end
end
class CreateDeliveryLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_locations do |t|

      t.integer :user_id
      t.string :postal_code
      t.text :address
      t.string :name

      t.timestamps
    end
  end
end

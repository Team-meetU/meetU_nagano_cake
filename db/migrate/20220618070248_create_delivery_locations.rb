class CreateDeliveryLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_locations do |t|

      t.integer :id
      t.integer :item_id
      t.string :postal_code
      t.text :address
      t.string :family_name
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end

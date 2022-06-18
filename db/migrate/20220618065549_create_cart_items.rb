class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|

      t.integer :id
      t.integer :item_id
      t.quantity :user_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end

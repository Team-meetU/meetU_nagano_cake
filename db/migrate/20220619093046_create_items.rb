class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string  :name
      t.text    :explanation
      t.integer :price
      t.boolean :is_stock, default: "ture"

      t.timestamps
    end
  end
end
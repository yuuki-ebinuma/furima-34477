class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name,         null: false
      t.text    :product_description, null: false
      t.integer :category_id,         null: false
      t.integer :user_id,             null: false,foreign_key: true 
      t.integer :ship_city_id,        null: false
      t.integer :ship_date_id,        null: false
      t.integer :ship_charge_id,      null: false
      t.integer :product_status_id,   null: false
      t.integer :amount_sold,         null: false

      t.timestamps
    end
  end
end

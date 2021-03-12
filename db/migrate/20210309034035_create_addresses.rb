class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string  :postal_code,      null: false
      t.string  :ship_region,      null: false
      t.string  :ship_address,     null: false
      t.integer :ship_city_id,     null: false
      t.string  :building,         null: false
      t.string  :phone,            null: false
      t.integer :buyer_id,         null: false,foreign_key: true


      t.timestamps
    end
  end
end

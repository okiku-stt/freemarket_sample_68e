class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.string :ship_family_name,        null: false
      t.string :ship_last_name,          null: false
      t.string :ship_j_family_name,      null: false
      t.string :ship_j_last_name,        null: false
      t.integer :postal_code,            null: false
      t.string :prefectures,             null: false
      t.string :municipalities,          null: false
      t.string :house_number,            null: false
      t.string :building
      t.integer :phone_number

      t.timestamps
    end
  end
end

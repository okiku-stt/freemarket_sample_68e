class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.string :prefectures
      t.string :municipalities
      t.string :address
      t.string :building
      t.integer :phone_number

      t.timestamps
    end
  end
end

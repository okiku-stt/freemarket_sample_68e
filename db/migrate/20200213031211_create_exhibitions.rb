class CreateExhibitions < ActiveRecord::Migration[5.2]
  def change
    create_table :exhibitions do |t|
      t.integer :user_id,               null: false, foreign_key: true
      t.integer :categorys_id,           null: false, foreign_key: true
      t.integer :bland_id,              null: false, foreign_key: true
      t.string  :shipping_charges,       null: false
      t.string  :shipping_area,          null: false
      t.string  :shipping_date,         null: false
      t.integer :price,                 null: false
      t.timestamps
    end
  end
end

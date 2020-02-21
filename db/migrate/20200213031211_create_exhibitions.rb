class CreateExhibitions < ActiveRecord::Migration[5.2]
  def change
    create_table :exhibitions do |t|
      t.integer :user_id,               null: false, foreign_key: true
      t.string :categorys_name,           null: false
      t.string  :shipping_charges,       null: false
      t.integer  :prefecture_id,       null: false
      # t.string  :shipping_area,       null: false
      t.string  :shipping_date,         null: false
      t.integer :price,                 null: false
      t.string  :item_name,             null: false
      t.string  :item_status,           null: false
      t.timestamps
    end
  end
end
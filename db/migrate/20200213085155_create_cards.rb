class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :card_number, null: false, unique: true
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :security_number, null: false
      t.timestamps
    end
  end
end

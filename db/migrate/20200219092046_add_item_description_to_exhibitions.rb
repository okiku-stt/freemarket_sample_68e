class AddItemDescriptionToExhibitions < ActiveRecord::Migration[5.2]
  def change
    add_column :exhibitions, :item_description, :text
  end
end

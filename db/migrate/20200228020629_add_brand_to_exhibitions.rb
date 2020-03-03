class AddBrandToExhibitions < ActiveRecord::Migration[5.2]
  def change
    add_column :exhibitions, :brand, :string
  end
end

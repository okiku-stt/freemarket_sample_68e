class AddDealToExhibitions < ActiveRecord::Migration[5.2]
  def change
    add_column :exhibitions, :deal, :integer, null: false, default: 0
  end
end

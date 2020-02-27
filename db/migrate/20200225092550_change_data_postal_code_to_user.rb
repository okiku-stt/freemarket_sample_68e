class ChangeDataPostalCodeToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :postal_code, :string
    change_column :addresses, :phone_number, :string
  end
end

class AddAddressToBuffet < ActiveRecord::Migration[7.1]
  def change
    add_column :buffets, :address, :string, null: false
  end
end

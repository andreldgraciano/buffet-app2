class CreateBuffets < ActiveRecord::Migration[7.1]
  def change
    create_table :buffets do |t|
      t.string :brand_name, null: false
      t.string :corporation_name, null: false
      t.text :description, null: false
      t.integer :cnpj, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.string :district, null: false
      t.string :state, null: false
      t.string :city, null: false
      t.string :cep, null: false
      t.references :buffet, null: false, foreign_key: true

      t.timestamps
    end
  end
end

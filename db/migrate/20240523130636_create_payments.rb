class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end

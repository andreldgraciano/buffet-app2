class AddNameCpfToCustomer < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :name, :string, null: false
    add_column :customers, :cpf, :string, null: false
  end
end

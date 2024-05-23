class CreateJoinTableBuffetsPayments < ActiveRecord::Migration[7.1]
  def change
    create_join_table :buffets, :payments do |t|
      t.index [:buffet_id, :payment_id]
      t.index [:payment_id, :buffet_id]
    end
  end
end

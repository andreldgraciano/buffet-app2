class AddBuffetProfileRefeencesToBuffet < ActiveRecord::Migration[7.1]
  def change
    add_reference :buffets, :buffet_profile, null: false, foreign_key: true
  end
end

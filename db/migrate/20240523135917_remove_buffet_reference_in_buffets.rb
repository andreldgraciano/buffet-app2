class RemoveBuffetReferenceInBuffets < ActiveRecord::Migration[7.1]
  def change
    remove_reference :buffets, :buffet, foreign_key: true, null: false
  end
end

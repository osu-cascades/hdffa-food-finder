class CreatePartnersProductJoingTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :products, :partners do |t|
      t.index :product_id
      t.index :partner_id
    end
  end
end

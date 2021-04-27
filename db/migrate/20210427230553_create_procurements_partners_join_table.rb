class CreateProcurementsPartnersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :procurements, :partners do |t|
      t.index :procurement_id
      t.index :partner_id
    end
  end
end

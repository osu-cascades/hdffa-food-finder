class CreateValuesPartnersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :values, :partners do |t|
      t.index :value_id
      t.index :partner_id
    end
  end
end

class CreateDietariesPartnersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :dietaries, :partners do |t|
      t.index :dietary_id
      t.index :partner_id
    end
  end
end

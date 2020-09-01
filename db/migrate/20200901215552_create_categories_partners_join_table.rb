class CreateCategoriesPartnersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :partners do |t|
      t.index :category_id
      t.index :partner_id
    end
  end
end

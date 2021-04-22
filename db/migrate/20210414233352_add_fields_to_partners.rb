class AddFieldsToPartners < ActiveRecord::Migration[5.2]
  def change
    add_column :partners, :discount, :text
  end
end

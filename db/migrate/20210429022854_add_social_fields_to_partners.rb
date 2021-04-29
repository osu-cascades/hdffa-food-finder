class AddSocialFieldsToPartners < ActiveRecord::Migration[5.2]
  def change
    add_column :partners, :twitter, :string
    add_column :partners, :instagram, :string
    add_column :partners, :facebook, :string
  end
end

class AddZipAdrressCityStateToProviders < ActiveRecord::Migration[5.2]
  def change
    add_column :providers, :street_address, :string
    add_column :providers, :city, :string
    add_column :providers, :state, :string
    add_column :providers, :zip, :string
  end
end

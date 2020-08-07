class AddDescriptionToProviders < ActiveRecord::Migration[5.2]
  def change
    add_column :providers, :description, :string
  end
end

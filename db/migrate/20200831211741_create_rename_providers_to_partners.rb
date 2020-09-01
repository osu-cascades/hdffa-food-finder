class CreateRenameProvidersToPartners < ActiveRecord::Migration[5.2]
  def change
    rename_table :providers, :partners
  end
end

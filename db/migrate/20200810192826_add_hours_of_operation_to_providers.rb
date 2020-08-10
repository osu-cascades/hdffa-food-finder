class AddHoursOfOperationToProviders < ActiveRecord::Migration[5.2]
  def change
    add_column :providers, :hours_of_operation, :string
  end
end

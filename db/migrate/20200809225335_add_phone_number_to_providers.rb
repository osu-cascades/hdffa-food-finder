class AddPhoneNumberToProviders < ActiveRecord::Migration[5.2]
  def change
    add_column :providers, :phone, :string
  end
end

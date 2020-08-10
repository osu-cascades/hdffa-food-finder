class AddKeywordsToProviders < ActiveRecord::Migration[5.2]
  def change
    add_column :providers, :keywords, :string
  end
end

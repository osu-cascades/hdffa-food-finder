class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :timestamp
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end

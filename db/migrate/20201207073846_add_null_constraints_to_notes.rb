class AddNullConstraintsToNotes < ActiveRecord::Migration[5.2]
  def up
    change_column_null :notes, :title, false
    change_column_null :notes, :body, false
    change_column_null :notes, :partner_id, false
    change_column_null :notes, :user_id, false
  end

  def down
    change_column_null :notes, :title, true
    change_column_null :notes, :body, true
    change_column_null :notes, :partner_id, true
    change_column_null :notes, :user_id, true
  end
end

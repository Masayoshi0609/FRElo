class RenameBodyTypeToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :body_type, :body_type_id
  end
end

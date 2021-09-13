class ChangeDatatypeBodyTypeIdOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :body_type_id, :integer
  end
end

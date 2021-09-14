class RemoveImageIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :image_id, :string
  end
end

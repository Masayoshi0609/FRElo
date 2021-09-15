class RemoveImageToBodyTypes < ActiveRecord::Migration[5.2]
  def change
    remove_column :body_types, :image, :string
  end
end

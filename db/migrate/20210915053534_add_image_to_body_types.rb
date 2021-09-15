class AddImageToBodyTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :body_types, :image, :string
  end
end

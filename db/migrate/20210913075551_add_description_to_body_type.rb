class AddDescriptionToBodyType < ActiveRecord::Migration[5.2]
  def change
    add_column :body_types, :description, :text
  end
end

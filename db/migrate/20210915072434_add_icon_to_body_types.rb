class AddIconToBodyTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :body_types, :icon, :string
  end
end

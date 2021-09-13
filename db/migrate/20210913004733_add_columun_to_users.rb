class AddColumunToUsers < ActiveRecord::Migration[5.2]
  def change
     add_column :users, :name, :string
     add_column :users, :telephone_number, :string
     add_column :users, :is_deleted, :boolean, default: false, null: false
     add_column :users, :height, :string
     add_column :users, :weight, :string
     add_column :users, :age, :string
     add_column :users, :living_area, :string
     add_column :users, :body_type, :integer, default: 4, null: false
     add_column :users, :exercise_frequency, :integer, default: 0, null: false
     add_column :users, :fat_percentage, :string
     add_column :users, :introduction, :text
     add_column :users, :image_id, :string
  end
end

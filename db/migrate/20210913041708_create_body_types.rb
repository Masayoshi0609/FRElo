class CreateBodyTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :body_types do |t|
      t.string :name, default: "", null: false

      t.timestamps
    end
  end
end

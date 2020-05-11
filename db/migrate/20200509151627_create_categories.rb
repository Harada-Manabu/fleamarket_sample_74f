class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :categoryName, null: false
      t.timestamps
    end

    add_index :categories, :categoryName
  end
end

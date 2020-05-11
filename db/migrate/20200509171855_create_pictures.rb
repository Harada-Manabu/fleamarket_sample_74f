class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.references :good,    null: false, foreign_key: true
      t.string :goodsImage,   null: false
      t.timestamps
    end
  end
end

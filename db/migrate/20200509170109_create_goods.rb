class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.references :user,          null: false, foreign_key: true
      t.string :goodsName,         null: false
      t.text :explanation,         null: false
      t.references :category,      null: false, foreign_key: true
      t.string :brand
      t.string :goodsCondition,    null: false
      t.string :deliveryFee,       null: false
      t.string :prefecture,        null: false
      t.string :deliveryDay,       null: false
      t.integer :price,            null: false
      t.timestamps
    end

    add_index :goods, :goodsName
    add_index :goods, :brand
  end
end

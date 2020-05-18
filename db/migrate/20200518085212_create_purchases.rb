class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.references :good, null: false, foreign_key: true
      t.string :purchaser_id
      t.timestamps
    end
  end
end

class CreateDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :familyName, null: false
      t.string :firstName, null: false
      t.string :familyNameKana, null: false
      t.string :firstNameKana, null: false
      t.integer :postCode, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :buildingName
      t.integer :telNumber

      t.timestamps
    end
  end
end

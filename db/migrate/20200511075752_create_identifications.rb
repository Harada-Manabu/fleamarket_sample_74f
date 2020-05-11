class CreateIdentifications < ActiveRecord::Migration[5.2]
  def change
    create_table :identifications do |t|
      t.string :familyName, null: false
      t.string :firstName, null: false
      t.string :familyNameKana, null: false
      t.string :firstNameKana, null: false
      t.date :birthday, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

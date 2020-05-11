class CreateIdentifications < ActiveRecord::Migration[5.2]
  def change
    create_table :identifications do |t|

      t.timestamps
    end
  end
end

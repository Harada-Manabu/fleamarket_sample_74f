class CreatePlaces < ActiveRecord::Migration[5.2]

  def change
    create_table :places do |t|
      t.integer :prefecture_id
      t.timestamps
    end
  end

end

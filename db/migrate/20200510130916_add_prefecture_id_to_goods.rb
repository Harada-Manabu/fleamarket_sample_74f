class AddPrefectureIdToGoods < ActiveRecord::Migration[5.2]
  def change
    add_column :goods, :prefecture_id, :integer
  end
end

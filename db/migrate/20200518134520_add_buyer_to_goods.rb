class AddBuyerToGoods < ActiveRecord::Migration[5.2]
  def change
    add_column :goods, :buyer_id, :string
  end
end

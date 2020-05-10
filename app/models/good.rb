class Good < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :pictures
  accepts_nested_attributes_for :pictures, allow_destroy: true

  validates :user_id, :goodsName, :explanation, :category_id, :goodsCondition, :deliveryFee, :prefecture, :deliveryDay, :price, presence: true
end

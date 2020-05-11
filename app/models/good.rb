class Good < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :pictures
  accepts_nested_attributes_for :pictures, allow_destroy: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :user_id, :goodsName, :explanation, :category_id, :goodsCondition, :deliveryFee, :prefecture_id, :deliveryDay, :price, presence: true
end

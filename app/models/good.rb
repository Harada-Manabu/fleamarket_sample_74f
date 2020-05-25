class Good < ApplicationRecord

  belongs_to :user
  belongs_to :category
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates_associated :pictures
  validates :user_id, :goodsName, :explanation, :category_id, :goodsCondition, :deliveryFee, :prefecture_id, :deliveryDay, :price, :pictures, presence: true
  validate :check_pictures_number

  private
  def check_pictures_number
    errors.add(:pictures, "は５枚までです") if pictures.size > 5
  end
end

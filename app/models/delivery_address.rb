class DeliveryAddress < ApplicationRecord
  belongs_to :user, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :familyName, :firstName, :familyNameKana, :firstNameKana, :postCode, :prefecture_id, :city, :address, presence: true
end

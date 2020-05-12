class DeliveryAddress < ApplicationRecord
  belongs_to :user, optional: true
  validates :familyName, :firstName, :familyNameKana, :firstNameKana, :postCode, :prefecture_id, :city, :address, presence: true
end

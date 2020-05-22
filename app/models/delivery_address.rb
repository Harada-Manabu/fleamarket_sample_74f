class DeliveryAddress < ApplicationRecord
  belongs_to :user, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :familyName, :firstName, :prefecture_id, :city, :address, presence: true

  validates :familyNameKana, :firstNameKana, presence: true,
                                              format: {
                                                with: /\A[ぁ-ん]+\z/,
                                                message: "はひらがなで入力してください"
                                              }

  validates :postCode, length: { is: 7}, presence: true

end

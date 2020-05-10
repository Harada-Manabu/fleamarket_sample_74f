class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :good

  validates :goodsId, :goodsImage, presence: true
end

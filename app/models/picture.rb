class Picture < ApplicationRecord
  mount_uploader :goodsImage, ImageUploader

  belongs_to :good

  validates :goodsImage, presence: true
end

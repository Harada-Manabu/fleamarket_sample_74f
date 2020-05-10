class Category < ApplicationRecord
  has_many :goods

  validates :categoryName, presence: true
end

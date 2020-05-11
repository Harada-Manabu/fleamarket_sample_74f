class Category < ApplicationRecord
  has_many :goods
  has_ancestry

  validates :categoryName, presence: true
end

class Good < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :pictures
end

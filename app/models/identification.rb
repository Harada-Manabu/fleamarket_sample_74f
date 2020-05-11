class Identification < ApplicationRecord
  belongs_to :user, optional: true
  validates :familyName, :firstName, :familyNameKana, :firstNameKana, :birthday, presence: true
end

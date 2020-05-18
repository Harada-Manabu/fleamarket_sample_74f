class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :goods
  has_one :identification
  has_one :deliveryAddress
  has_one :credit_card, dependent: :destroy
  
  validates :nickname, presence: true

end

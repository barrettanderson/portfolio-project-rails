class User < ApplicationRecord
    has_many :orders
    has_many :food_banks, through: :orders

    validates :email, presence: true, uniqueness: true
    has_secure_password
end

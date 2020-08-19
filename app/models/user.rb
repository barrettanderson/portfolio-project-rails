class User < ApplicationRecord
    has_many :orders
    has_many :food_banks, through: :orders

    validates :username, presence: true, uniqueness: true
    has_secure_password
end

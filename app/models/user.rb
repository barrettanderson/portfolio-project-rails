class User < ApplicationRecord
    has_many :orders
    has_many :food_banks, through: :orders
end

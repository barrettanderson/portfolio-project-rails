class User < ApplicationRecord
    has_many :orders
    has_many :food_banks, through: :orders

    validates :email, presence: true, uniqueness: true
    has_secure_password

    # scope :most_recent_order, -> { self.orders.order(created_at: :desc LIMIT 1) }

    def self.find_or_create_from_omniauth(user_info)
        User.first_or_create(uid: user_info["uid"]) do |user|
            user.email = user_info["info"]["email"]
            user.password = SecureRandom.hex
        end
    end
end

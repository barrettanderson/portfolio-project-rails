class FoodBank < ApplicationRecord
    has_many :orders
    has_many :users, through: :orders
    # Joins with orders to bring in that collection where orders.created at orders.created_at
    scope :todays_orders, -> { joins(:orders).where("orders.created_at > ?", 1.days.ago) }
end

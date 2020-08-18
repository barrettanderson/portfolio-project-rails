class Order < ApplicationRecord
    belongs_to :user
    belongs_to :food_bank

end

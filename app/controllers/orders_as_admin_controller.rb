class OrdersAsAdminController < ApplicationController

    def index
        if params[:food_bank_id]
            @orders = Order.where(food_bank_id: params[:food_bank_id])
        else
            @orders = Order.all
        # binding.pry
        end
    end

    def new
        @order = Order.new
    end
end

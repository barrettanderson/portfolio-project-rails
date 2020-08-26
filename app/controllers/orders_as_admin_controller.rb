class OrdersAsAdminController < ApplicationController

    def index
        if params[:food_bank_id]
            @orders = Order.where(food_bank_id: params[:food_bank_id])
        else
            @orders = Order.all
        end
    end

    def new
        @order = Order.new
    end

    def create
        @order = Orders.create(order_params)
        if @order.save
            redirect_to food_bank_orders_as_admin_index_path(current_foodbank)
        else
            flash[:notice] = "Missing item(s) from order, fill in all options"
            render :new
        end
    end

    def show
        @order = Order.find_by_id(params[:id])
    end

    private

        def order_params
            params.require(:order).permit(:user_id, :food_bank_id, :protein, :vegetable, :fruit, :grain, :dairy, :dessert)
        end
end

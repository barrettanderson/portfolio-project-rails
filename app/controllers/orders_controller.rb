class OrdersController < ApplicationController
    before_action :set_order, except: [:index, :new, :create]

    def index
        @orders = Order.all
    end

    def new
        @order = Order.new
    end

    def show
    end

    def create
        @order = Order.create(order_params)
        if @order.save
            redirect_to orders_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @order.update(order_params)
            redirect_to order_path(@order)
        else
            render :edit
        end
    end

    def destroy
        @order.destroy
        redirect_to orders_path
    end

    private

        def set_order
            @order = Order.find_by_id(params[:id])
        end

        def order_params
            params.require(:order).permit(:user_id, :food_bank_id, :protein, :vegetable, :fruit, :grain, :dairy, :dessert)
        end

end

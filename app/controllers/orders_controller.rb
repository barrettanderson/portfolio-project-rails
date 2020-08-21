class OrdersController < ApplicationController
    before_action :set_order, except: [:index, :new, :create]

    def index
        @orders = Order.all
    end

    def new
        @order = Order.new
    end

    def show
        if current_user == @order.user
            render :show
        else
            redirect_to root_path
        end
    end

    def create
        # @order = Order.create(order_params)
        @order = current_user.orders.build(order_params)
        if @order.save
            redirect_to user_orders_path(current_user)
        else
            flash[:notice] = "Missing item(s) from order, fill in all options"
            render :new
        end
    end

    def edit
        if current_user == @order.user
            render :edit
        else
            redirect_to root_path
        end
    end

    def update
        if current_user == @order.user 
            if @order.update(order_params)
                redirect_to user_order_path(current_user, @order)
            else
                render :edit
            end
        else
            redirect_to root_path
        end
    end

    def destroy
        if current_user == @order.user
            @order.destroy
            redirect_to user_orders_path(current_user)
        else
            redirect_to root_path
        end
    end

    private

        def set_order
            @order = Order.find_by_id(params[:id])
        end

        def order_params
            params.require(:order).permit(:user_id, :food_bank_id, :protein, :vegetable, :fruit, :grain, :dairy, :dessert)
        end

end

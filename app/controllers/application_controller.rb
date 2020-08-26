class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :current_foodbank

    private
        def current_user
            User.find_by_id(session[:user_id]) if logged_in?
        end

        def logged_in?
            !!session[:user_id]
        end

        def current_foodbank
            FoodBank.find_by_food_bank_id(params[:food_bank_id])
        end
end

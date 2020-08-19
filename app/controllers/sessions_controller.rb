class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    private
        def user_params
            params.require(:user).permit(:username, :password)
        end
end

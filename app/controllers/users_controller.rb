class UsersController < ApplicationController
    def index
        @users = User.all
    end



    def show
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render :show
        else
            render json: @user.errors, status: 422
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :name)
    end
end

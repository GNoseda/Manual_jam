class UsersController < ApplicationController
    before_action :set_user, only: [:show]
    skip_before_action :require_login, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        
        respond_to do |format|
          if @user.save
            format.html { redirect_to @user, notice: 'User successfully created!.' }
            format.json { render :show, status: :created, location: @user }
            session[:user_id] = @user.id
        else
            format.html { render :new }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
    end

    def show
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def set_user
        @user = User.find(params[:id])
    end
end

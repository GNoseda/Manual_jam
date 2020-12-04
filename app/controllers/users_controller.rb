class UsersController < ApplicationController
    before_action :set_user, only: [:show]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        
        respond_to do |format|
          if @user.save
            format.html { redirect_to @user, notice: 'Usuario creado exitosamente!.' }
            format.json { render :show, status: :created, location: @user }
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

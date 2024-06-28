class UsersController < ApplicationController
    before_action :set_user, only: %i[edit update]
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: 'User was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if params[:user][:password].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
  
      if @user.update(user_params)
        redirect_to profile_path, notice: 'Profile was successfully updated.'
      else
        render :edit
      end
    end
  
    private
  
    def set_user
      @user = current_user
    end
  
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :role, :profile_image)
    end
end
  
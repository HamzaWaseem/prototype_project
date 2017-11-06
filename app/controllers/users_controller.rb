class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update, :destroy]

  # load_and_authorize_resource

  def index
    if @current_user_role == AppConstants::ADMIN
      @users = User.where.not(id: current_user)
    else
      @users = User.where(id: current_user.id)
    end
  end

  def edit
  end

  def update
    # binding.pry
      if @user.update(user_params)
        redirect_to users_path
      end
  end

  def destroy
    # binding.pry
    if @user.destroy
      redirect_to users_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation, :username)
  end

  def set_user
    @user = User.find(params[:id])
  end
  
  def update_user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation, :username)
  end
end
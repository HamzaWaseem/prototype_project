class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update, :destroy]

  load_and_authorize_resource

  def index
      @users = User.all
  end

  def edit
    # binding.pry
  end

  def update
    # binding.pry
      if @user.update(update_user_params)
        user = @user
        role = user.roles.last.name
        user.remove_role role
        user.add_role(params[:user][:roles_name])
        redirect_to dashboards_path
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
    params.require(:user).permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation, :username, :role_name)
  end
end

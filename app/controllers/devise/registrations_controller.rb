class Devise::RegistrationsController < DeviseController
  def new
    # binding.pry
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.add_role(AppConstants::USER)
      redirect_to users_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation, :username)
  end
end
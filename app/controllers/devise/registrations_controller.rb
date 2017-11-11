class Devise::RegistrationsController < DeviseController
  def new
    # binding.pry
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.new(user_params)
    if @user.valid?
      if @user.save
        @user.add_role(AppConstants::USER)
        redirect_to users_path
      end
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation, :username)
  end
end
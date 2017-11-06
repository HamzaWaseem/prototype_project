class Ability
  include CanCan::Ability
  
  def initialize(user)
    unless user.nil?
      role = user.roles.last.name

      if role == AppConstants::ADMIN
        admin user
      end

      all_users user
    end
  end
  
  def admin(user)
    can :manage, User
    can :manage, Form
    can [:add_user], User
  end
  
  def all_users(user)
    can [:read, :update, :destroy], User, id: user.id
    cannot [:destroy], User
  end
  
end

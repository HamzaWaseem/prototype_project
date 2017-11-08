class Ability
  include CanCan::Ability
  
  def initialize(user)
    unless user.nil?
      role = user.roles.last.name

      if role == AppConstants::ADMIN
        admin user
      elsif role == AppConstants::TEAM_LEADER
        team_leader user
      elsif role == AppConstants::SPECIALIST
        specialist user
      elsif role == AppConstants::USER
        all_users user
      end

    end
  end
  
  def admin(user)
    can :manage, User
    can :manage, Form
  end

  def team_leader(user)
    can :update, User, id: user.id
    cannot :read, User
    cannot :destroy, User
    can :manage, Form
  end

  def specialist(user)
    can :update, User, id: user.id
    cannot :read, User
    cannot :destroy, User
    can :read, Form
    cannot :update, Form
    cannot :create, Form
    cannot :destroy, Form
  end
  
  def all_users(user)
    can :update, User, id: user.id
    cannot :read, User
    cannot :destroy, User
    can :read, Form
    cannnot :update, Form
    cannot :create, Form
    cannot :destroy, Form
  end
  
end

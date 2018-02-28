class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif
      can :read, Chat
      can :create, Chat
    end

  end
end
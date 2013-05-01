class Ability
  include CanCan::Ability

  def initialize(user)
     user ||= User.new # guest user (not logged in)
    unless user.new_record?
      can :read, Job
      can [:create, :update, :destroy], Job, :user => user
      can :read, Profile
      can [:create, :update, :destroy], Profile, :user => user
    else
      can :read, Job
      can :read, Profile
    end
  end
end

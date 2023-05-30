# frozen_string_literal: true

class Ability
  include CanCan::Ability

  #def initialize(user)
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  #end

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user_signed_in? 
      can :manage, Train
      can :manage, Seat
      can :manage, Station
      can :manage, Ticket
      can :manage, Passenger
      can :manage, Payment

    else
      can :read, Train
    end
  end

end

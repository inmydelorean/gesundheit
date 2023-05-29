# frozen_string_literal: true

class UserAbility
  include CanCan::Ability

  def initialize(user)
    can :read, Category
    return unless user.present?
    can :create, Appointment
    can :read, Appointment, user_id: user.id
  end
end

class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:user_profile]
  before_action :authenticate_doctor!, only: [:doctor_profile]

  def doctor_profile
    @pending_appointments = current_doctor.appointments.pending.order(time: :asc)
    @completed_appointments = current_doctor.appointments.completed.order(time: :desc)
  end

  def user_profile
    @pending_appointments = current_user.appointments.pending.order(time: :asc)
    @completed_appointments = current_user.appointments.completed.order(time: :desc)
  end
end
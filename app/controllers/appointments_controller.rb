class AppointmentsController < ApplicationController
  load_and_authorize_resource

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = current_user.appointments.build(appointment_params)
    if @appointment.save
      redirect_to @appointment
    else
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:time, :user_id, :doctor_id, :description, :completed)
  end
end

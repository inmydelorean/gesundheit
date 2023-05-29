class RecommendationsController < ApplicationController
  def create
    @appointment = Appointment.find(params[:appointment_id])
    @recommendation = @appointment.build_recommendation(recommendation_params)
    @appointment.update(completed: true)
    redirect_to appointment_path(@appointment)
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:body, :doctor_id, :appointment_id)
  end
end
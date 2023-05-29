require 'rails_helper'

RSpec.describe "Appointments", type: :request do

  describe "POST /appointments" do
    context "with valid attributes" do
      it "creates an appointment" do
        doctor = FactoryBot.create(:doctor)
        patient = FactoryBot.create(:user)
        sign_in patient
        appointment =
          { time: Faker::Date.forward(days: 10),
            doctor_id: doctor.id,
            user_id: patient.id
          }
        expect { post appointments_path, params: { appointment: appointment } }.to change(Appointment, :count).by(1)
        expect(response).to redirect_to(appointment_path(Appointment.last))
      end
    end

    context "with invalid attributes" do
      it "does not create an appointment without time" do
        doctor = FactoryBot.create(:doctor)
        patient = FactoryBot.create(:user)
        sign_in patient
        appointment =
          { time: nil,
            doctor_id: doctor.id,
            user_id: patient.id
          }
        expect { post appointments_path, params: { appointment: appointment } }.to_not change(Appointment, :count)
        expect(response).to render_template(:new)
      end
    end
  end
end

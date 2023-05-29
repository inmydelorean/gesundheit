require 'rails_helper'

RSpec.feature "Recommendations", type: :feature do
  scenario "doctor adds a recommendation" do
    doctor = FactoryBot.create(:doctor)
    user = FactoryBot.create(:user)
    appointment = FactoryBot.create(:appointment, user: user, doctor: doctor)
    sign_in doctor
    visit appointment_path(appointment)
    fill_in "recommendation[body]", with: "Recommendation text goes here"
    click_button "Add a recommendation"
    expect(page).to have_content "Completed"
    expect(page).to have_content "Recommendation text goes here"
  end
end

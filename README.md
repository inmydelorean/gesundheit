# Gesundheit (test task for a Ruby developer position)

### Goal: Build a web application that allows users to create and track appointments with doctors. The application should allow users to:

- There are three user roles User (Patient), Doctor, Admin
- User can sign up, open Profile, browse doctors by category, create an appointment, get a recommendation
- Doctor can sign in, open Profile, browse appointments, create a recommendation
- Admin can browse patients and doctors, create a doctor, create a category, assign a doctor to a category, etc

#### Additional requirements:

- Appointment should be completed (closed) after a recommendation is added
- Log in through phone_number
- Doctor can have only 10 pending appointments at a time

Tech requirements:

- RoR
- Devise
- CanCanCan
- RSpec, Capybara, FactoryBot, Faker
- S3/Cloudinary for images
- ActiveAdmin/Administrate for admin section
- Deploy to Heroku

Notes:

- There are instances where code could have been much DRYer (took shortcuts for the sake of time)
- I considered thorough phone number validation but figured it's not the point of the task

Things that I'd have added otherwise but skipped due to time/out of scope constraints:

- Hotwire (Turbo, Stimulus)
- ActionText
- ActionMailer

FactoryBot.define do
  factory :doctor do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone_number { Faker::PhoneNumber.cell_phone }
    practice_start { Faker::Date.between(from: 20.years.ago, to: Date.today) }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
  end
end

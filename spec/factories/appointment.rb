FactoryBot.define do
  factory :appointment do
    doctor_id { FactoryBot.create(:doctor).id }
    user_id { FactoryBot.create(:user).id }
    time { Faker::Date.forward(days: 10) }
    description { Faker::Lorem.paragraph }
  end
end
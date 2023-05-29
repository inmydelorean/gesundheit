require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:doctor) }
    it { should validate_presence_of(:phone_number).with_message("can't be blank") }
    it { should validate_uniqueness_of(:phone_number).case_insensitive.with_message("has already been taken")}
  end
end

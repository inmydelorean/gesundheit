class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable, :timeoutable

  validates :phone_number, presence: true, uniqueness: true
  validates :first_name, :last_name, :date_of_birth, presence: true

  has_many :appointments
  has_many :doctors, through: :appointments

  def email_required?
    false
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def child?
    date_of_birth > 18.years.ago
  end
end

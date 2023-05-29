class Doctor < ApplicationRecord
  devise :database_authenticatable, :validatable, :timeoutable

  has_many :appointments
  has_many :users, through: :appointments
  has_many :recommendations, dependent: :destroy
  has_many :doctor_categories, dependent: :destroy
  has_many :categories, through: :doctor_categories
  has_one_attached :photo

  validates :first_name, :last_name, :email, :phone_number, presence: true
  validates :email, uniqueness: true
  validates :phone_number, uniqueness: true


  scope :available, -> {
    joins("LEFT OUTER JOIN appointments ON doctors.id = appointments.doctor_id")
      .where('appointments.completed = ? OR appointments.completed IS NULL', false)
      .group('id')
      .having('COUNT(appointments.id) < 10')
  }

  scope :doctor_categories, -> (category_id) {
    joins(:doctor_categories)
      .where(doctor_categories: { category_id: category_id })
  }

  def email_required?
    false
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def doctor_with_category
    "#{full_name}: #{categories.pluck(:name).join(', ')}"
  end

  def available?
    appointments.pending.count < 10
  end

  def years_of_experience
    Time.now.year - practice_start.year
  end
end

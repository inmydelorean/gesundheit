class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  has_one :recommendation, dependent: :destroy

  validates :time, :user_id, :doctor_id, presence: true

  scope :pending, -> { where(completed: false) }
  scope :completed, -> { where(completed: true) }
end

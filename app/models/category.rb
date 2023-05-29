class Category < ApplicationRecord
  has_many :doctor_categories, dependent: :destroy
  has_many :doctors, through: :doctor_categories
  has_one_attached :picture

  validates :name, presence: true, uniqueness: true

  scope :with_doctors, -> { joins(:doctors).distinct }
end

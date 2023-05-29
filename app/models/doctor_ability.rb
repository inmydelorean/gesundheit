class DoctorAbility
  include CanCan::Ability

  def initialize(doctor)
    can :read, Category
    return unless doctor.present?
    can :read, Appointment, doctor_id: doctor.id
  end
end
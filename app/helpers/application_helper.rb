module ApplicationHelper
  def doctor_categories(id)
    DoctorCategory.where(doctor_id: id).each { |dc| [] << dc.category.name}
  end
end

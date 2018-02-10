# json.employees @employees, :id, :email, :designation
json.array! @employees do |employee|
  json.id employee.id
  json.user_id employee.user_id
  json.name employee.full_name
  json.email employee.email
  json.password employee.password
  json.image employee.image_url
  json.mobile employee.mobile
  json.present_address employee.present_address
  json.country country_name(employee)
  json.department_id employee.department_id
  json.designation employee.designation.present? ? employee.designation.name : ''
  json.joining_date employee.joining_date
  json.is_active employee.is_active
end
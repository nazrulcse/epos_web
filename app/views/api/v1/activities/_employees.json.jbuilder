action = activity.key
action.slice! 'employee.'

json.id activity.trackable_id
json.log_id activity.id
json.model 'employee'
json.action action

employee = activity.trackable

if employee.present?
  json.id employee.id
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
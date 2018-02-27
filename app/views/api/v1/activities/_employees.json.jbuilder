action = activity.key
action.slice! 'employee.'

json.id activity.trackable_id
json.log_id activity.id
json.model 'employee'
json.action action

employee = activity.trackable

if employee.present?
  json.partial! 'api/v1/employees/employee', employee: employee
end
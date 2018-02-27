action = activity.key
action.slice! 'department.'

json.id activity.trackable_id
json.log_id activity.id
json.model 'department'
json.action action

department = activity.trackable

if department.present?
  json.partial! 'api/v1/departments/department', department: department
end
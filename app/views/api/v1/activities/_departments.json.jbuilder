action = activity.key
action.slice! 'department.'

json.id activity.trackable_id
json.log_id activity.id
json.model 'department'
json.action action

department = activity.trackable

if department.present?
  json.id department.id
  json.name department.name
  json.description department.description
  json.image department.image_url
  json.company_id department.company_id
  json.email department.email
  json.mobile department.mobile
end
json.id activity.id
action = activity.key
action.slice! 'department.'
json.action action
department = activity.trackable

json.department do
  json.id department.id
  json.name department.name
  json.name department.name
  json.description department.description
  json.image department.image_url
  json.company_id department.company_id
  json.email department.email
  json.mobile department.mobile
end
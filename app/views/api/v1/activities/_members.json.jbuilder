action = activity.key
action.slice! 'member.'

json.id activity.trackable_id
json.log_id activity.id
json.model 'member'
json.action action

member = activity.trackable

if member.present?
  json.partial! 'api/v1/members/member', member: member
end
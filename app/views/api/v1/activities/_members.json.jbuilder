json.id activity.id
json.model 'Member'
action = activity.key
action.slice! 'member.'
json.action action
member = activity.trackable

if member.present?
  json.member do
    json.partial! 'api/v1/members/member', member: member
  end
end
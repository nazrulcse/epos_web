json.array! @members do |member|
  json.id member.id
  json.code member.code
  json.name member.name
  json.email member.email
  json.mobile member.mobile
  json.address member.address
  json.point member.point
  json.last_point member.last_point
  json.is_active member.is_active
end
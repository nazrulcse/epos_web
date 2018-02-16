action = activity.key
action.slice! 'pos_customer.'

json.id activity.trackable_id
json.log_id activity.id
json.model 'customer'
json.action action

customer = activity.trackable

if customer.present?
  json.partial! 'api/v1/pos/customers/customer', customer: customer
end
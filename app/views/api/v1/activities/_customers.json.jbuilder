json.id activity.id
json.model 'Customer'
action = activity.key
action.slice! 'pos_customer.'
json.action action
customer = activity.trackable

json.customer do
  json.partial! 'api/v1/pos/customers/customer', customer: customer
end
action = activity.key
action.slice! 'pos_supplier.'

json.id activity.trackable_id
json.log_id activity.id
json.model 'supplier'
json.action action

supplier = activity.trackable

if supplier.present?
  json.partial! 'api/v1/pos/suppliers/supplier', supplier: supplier
end
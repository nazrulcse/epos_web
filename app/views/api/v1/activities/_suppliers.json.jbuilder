action = activity.key
action.slice! 'supplier.'

json.id activity.trackable_id
json.log_id activity.id
json.model 'pos_supplier'
json.action action

supplier = activity.trackable

if supplier.present?
  json.supplier do
    json.partial! 'api/v1/pos/suppliers/supplier', supplier: supplier
  end
end
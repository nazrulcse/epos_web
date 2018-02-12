json.id activity.id
json.model 'Supplier'
action = activity.key
action.slice! 'pos_supplier.'
json.action action
supplier = activity.trackable

json.supplier do
  json.partial! 'api/v1/pos/suppliers/supplier', supplier: supplier
end
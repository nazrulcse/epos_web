action = activity.key
action.slice! 'pos_product.'

json.id activity.trackable_id
json.log_id activity.id
json.model 'product'
json.action action

product = activity.trackable

if product.present?
  json.partial! 'api/v1/pos/products/product', product: product
end
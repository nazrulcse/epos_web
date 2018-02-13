json.id activity.id
json.model 'Product'
action = activity.key
action.slice! 'pos_product.'
json.action action
product = activity.trackable

json.product do
  json.partial! 'api/v1/pos/products/product', product: product
end
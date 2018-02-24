action = activity.key
action.slice! 'pos_products_price_tag.'

json.id activity.trackable_id
json.log_id activity.id
json.model 'price_tag'
json.action action

price_tag = activity.trackable

if price_tag.present?
  json.id price_tag.id
  json.product_id price_tag.product_id
  json.barcode price_tag.barcode
  json.sale_price price_tag.sale_price
end
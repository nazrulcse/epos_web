json.id product.id
json.product_code product.code
json.barcode product.barcode
json.name product.name
json.description product.description
json.department_id product.department_id
json.department product.department.present? ? product.department.name : ''
json.category_id product.category_id
json.category product.category.present? ? product.category.name : ''
json.sub_category_id product.sub_category_id
json.sub_category product.sub_category.present? ? product.sub_category.name : ''
json.model_id product.model_id
json.model product.model.present? ? product.model.name : ''
json.brand_id product.brand_id
json.brand product.brand.present? ? product.brand.name : ''
json.re_order_level product.re_order_level
json.cost_price product.cost_price
json.sale_price product.sale_price
json.expirable product.expirable
json.discountable product.discountable
json.stock product.stock_on_hand
json.is_active product.is_active
json.unit product.unit
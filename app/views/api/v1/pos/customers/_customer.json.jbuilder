json.id customer.id
json.name customer.name
json.company customer.company
json.address customer.address
json.city customer.city
json.email customer.email
json.mobile customer.mobile
json.initial_balance customer.initial_balance
json.credit_limit 0 #customer.credit_limit
json.department_id customer.department_id
json.department customer.department.present? ? customer.department.name : ''
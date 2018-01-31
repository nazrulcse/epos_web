json.id supplier.id
json.name supplier.name
json.company supplier.company
json.address supplier.address
json.city supplier.city
json.email supplier.email
json.mobile supplier.mobile
json.department_id supplier.department_id
json.department supplier.department.present? ? supplier.department.name : ''
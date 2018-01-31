class Pos::Customers::Payment < ActiveRecord::Base
  belongs_to :department
  belongs_to :employee
  belongs_to :invoice, :class_name => 'Pos::Customers::Invoice', foreign_key: :invoice_id
  belongs_to :customer, :class_name => 'Pos::Customer', foreign_key: :customer_id
end

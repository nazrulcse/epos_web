class Pos::Customers::Invoice < ActiveRecord::Base
  belongs_to :department
  belongs_to :employee
  belongs_to :customer, :class_name => 'Pos::Customer', foreign_key: :customer_id
  has_many :payments, :class_name => 'Pos::Customers::Payment', foreign_key: :invoice_id
  has_many :items, :class_name => 'Pos::Customers::InvoiceItem', foreign_key: :invoice_id
end

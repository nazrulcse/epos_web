class Pos::Customers::InvoiceItem < ActiveRecord::Base
  belongs_to :department
  belongs_to :invoice, :class_name => 'Pos::Customers::Invoice', foreign_key: :invoice_id
end

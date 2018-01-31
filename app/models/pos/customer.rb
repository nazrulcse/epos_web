class Pos::Customer < ActiveRecord::Base
  belongs_to :department
  has_many :invoices, :class_name => 'Pos::Customers::Invoice', foreign_key: :customer_id
  has_many :payments, :class_name => 'Pos::Customers::Payment', foreign_key: :customer_id
end

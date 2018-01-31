class Pos::Suppliers::Payment < ActiveRecord::Base
  belongs_to :department
  belongs_to :employee
  belongs_to :supplier, :class_name => 'Pos::Supplier', foreign_key: :supplier_id
  belongs_to :purchase, :class_name => 'Pos::Suppliers::Purchase', foreign_key: :purchase_id
end

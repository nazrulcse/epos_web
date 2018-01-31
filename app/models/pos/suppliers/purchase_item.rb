class Pos::Suppliers::PurchaseItem < ActiveRecord::Base
  belongs_to :department
  belongs_to :purchase, :class_name => 'Pos::Suppliers::Purchase', foreign_key: :purchase_id
end

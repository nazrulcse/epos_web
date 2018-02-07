class Pos::Suppliers::Purchase < ActiveRecord::Base
  belongs_to :department
  belongs_to :issued_employee, :class_name => 'Employee', foreign_key: :issued_employee_id
  belongs_to :received_employee, :class_name => 'Employee', foreign_key: :received_employee_id
  belongs_to :supplier, :class_name => 'Pos::Supplier', foreign_key: :supplier_id
  has_many :items, :class_name => 'Pos::Suppliers::PurchaseItem', foreign_key: :purchase_id, dependent: :destroy
  has_many :payments, :class_name => 'Pos::Suppliers::Payment', foreign_key: :purchase_id, dependent: :destroy
  has_many :stocks, :class_name => 'Pos::Stock', as: :stockable, dependent: :destroy

  accepts_nested_attributes_for :items,
                                :allow_destroy => true,
                                :reject_if => proc { |attributes|
                                  attributes.all? { |k, v| v.blank? }
                                }
end

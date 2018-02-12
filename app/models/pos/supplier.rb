class Pos::Supplier < ActiveRecord::Base
  belongs_to :department
  has_many :purchases, :class_name => 'Pos::Suppliers::Purchase', foreign_key: :supplier_id, dependent: :destroy
  has_many :payments, :class_name => 'Pos::Suppliers::Payment', foreign_key: :supplier_id, dependent: :destroy
  has_many :products, :class_name => 'Pos::Product', foreign_key: :supplier_id, dependent: :destroy

  include PublicActivity::Model
  tracked owner: proc { |controller, model| controller.current_employee },
          recipient: proc { |controller, model| controller.current_department }
end

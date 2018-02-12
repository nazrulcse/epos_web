class Pos::Customer < ActiveRecord::Base
  belongs_to :department
  belongs_to :category, :class_name => 'Pos::Customers::Category'
  has_many :invoices, :class_name => 'Pos::Customers::Invoice', foreign_key: :customer_id, dependent: :destroy
  has_many :payments, :class_name => 'Pos::Customers::Payment', foreign_key: :customer_id, dependent: :destroy

  include PublicActivity::Model
  tracked owner: proc { |controller, model| controller.current_employee },
          recipient: proc { |controller, model| controller.current_department }
end

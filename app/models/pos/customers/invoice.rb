class Pos::Customers::Invoice < ActiveRecord::Base
  belongs_to :department
  belongs_to :employee
  belongs_to :customer, class_name: 'Pos::Customer', foreign_key: :customer_id
  has_many :payments, class_name: 'Pos::Customers::Payment', foreign_key: :invoice_id, dependent: :destroy
  has_many :items, class_name: 'Pos::Customers::InvoiceItem', foreign_key: :invoice_id, dependent: :destroy
  has_many :stocks, class_name: 'Pos::Stock', as: :stockable, dependent: :destroy
  accepts_nested_attributes_for :items

  validates :global_id, uniqueness: true

  def due_amount
    net_total - payments.sum(:amount)
  end

  def paid
    payments.sum(:amount)
  end

  def self.active_invoice_customer(department)
    customers_ids = where(customer_id: department.customers.map(&:id), is_complete: false).map(&:customer_id)
    Pos::Customer.where(id: customers_ids)
  end
end

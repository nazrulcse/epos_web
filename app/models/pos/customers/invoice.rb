class Pos::Customers::Invoice < ActiveRecord::Base
  belongs_to :department
  belongs_to :employee
  belongs_to :customer, class_name: 'Pos::Customer', foreign_key: :customer_id
  has_many :payments, class_name: 'Pos::Customers::Payment', foreign_key: :invoice_id, dependent: :destroy
  has_many :items, class_name: 'Pos::Customers::InvoiceItem', foreign_key: :invoice_id, dependent: :destroy
  has_many :stocks, class_name: 'Pos::Stock', as: :stockable, dependent: :destroy
  accepts_nested_attributes_for :items

  validates :global_id, uniqueness: true

  after_create :check_payments, :check_items

  def due_amount
    (net_total - payments.sum(:amount)).round(2)
  end

  def paid
    payments.sum(:amount).round(2)
  end

  def self.active_invoice_customer(department)
    customers_ids = where(customer_id: department.customers.map(&:id), is_complete: false).map(&:customer_id)
    Pos::Customer.where(id: customers_ids)
  end

  def check_payments
    pays = department.customers_payments.where(invoice_global_id: id, invoice_id: nil)
    pays.update_all(invoice_id: id) if pays.present?
  end

  def check_items
    itms = department.invoice_items.where(invoice_global_id: id, invoice_id: nil)
    itms.update_all(invoice_id: id) if itms.present?
  end
end

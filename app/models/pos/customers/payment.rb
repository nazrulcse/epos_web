class Pos::Customers::Payment < ActiveRecord::Base
  belongs_to :department
  belongs_to :cashier, class_name: 'Employee'
  belongs_to :collected_by, class_name: 'Employee'
  belongs_to :bank_account, class_name: 'Bank::Account'
  belongs_to :invoice, class_name: 'Pos::Customers::Invoice', foreign_key: :invoice_id
  belongs_to :customer, class_name: 'Pos::Customer', foreign_key: :customer_id

  validates :global_id, uniqueness: true

  after_save :set_global_id
  before_create :check_invoice

  def self.update_some
    where(invoice_id: nil).upda
  end

  private

  def set_global_id
    update_attributes(global_id: "web-#{department.company.id}-#{department.id}-#{id}") unless global_id.present?
  end

  def check_invoice
    unless invoice_id.present?
      if invoice_global_id.present?
        inv = Pos::Customers::Invoice.find_by_global_id(invoice_global_id)
        self.invoice = inv if inv.present?
      end
    end
  end
end

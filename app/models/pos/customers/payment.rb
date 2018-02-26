class Pos::Customers::Payment < ActiveRecord::Base
  belongs_to :department
  belongs_to :cashier, class_name: 'Employee'
  belongs_to :collected_by, class_name: 'Employee'
  belongs_to :bank_account, class_name: 'Bank::Account'
  belongs_to :invoice, class_name: 'Pos::Customers::Invoice', foreign_key: :invoice_id
  belongs_to :customer, class_name: 'Pos::Customer', foreign_key: :customer_id

  validates :global_id, uniqueness: true
  validate :validate_value_date

  after_save :set_global_id
  before_create :check_invoice, :set_status
  before_save :set_value_date

  after_initialize :init

  def init
    self.amount ||= 0.0
    self.discount ||= 0.0
    self.total ||= 0.0
    self.commission ||= 0.0
  end

  def complete?
    status == 'complete'
  end

  def cash?
    payment_method == 'cash'
  end

  def cheque?
    payment_method == 'cheque'
  end

  private

  def set_status
    self.status = 'pending'
  end

  def set_value_date
    self.value_date = date if cash?
  end

  def validate_value_date
    if cheque? && [2, 5].include?(value_date.wday)
      errors.add(:value_date, "can't select Tuesday or Friday")
    end
  end

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

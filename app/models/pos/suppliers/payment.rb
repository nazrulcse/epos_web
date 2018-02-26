class Pos::Suppliers::Payment < ActiveRecord::Base
  belongs_to :department
  belongs_to :employee
  belongs_to :supplier, class_name: 'Pos::Supplier', foreign_key: :supplier_id
  belongs_to :purchase, class_name: 'Pos::Suppliers::Purchase', foreign_key: :purchase_id

  before_create :set_status
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
end

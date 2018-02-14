class Pos::Customer < ActiveRecord::Base
  belongs_to :department
  belongs_to :category, :class_name => 'Pos::Customers::Category'
  has_many :invoices, :class_name => 'Pos::Customers::Invoice', foreign_key: :customer_id, dependent: :destroy
  has_many :payments, :class_name => 'Pos::Customers::Payment', foreign_key: :customer_id, dependent: :destroy

  include PublicActivity::Model
  tracked owner: proc { |controller, model| controller.current_employee },
          recipient: proc { |controller, model| controller.current_department }

  after_initialize :init

  def init
    self.credit_limit ||= 0.0
  end

  def active_invoice
    invoices.where(is_complete: false, is_advance: false)
  end

  def advance_invoice
    invoices.where(is_advance: true, is_complete: false)
  end

  def total_invoice
    @total_invoice ||= self.invoices.where(is_advance: false).map(&:invoice_total).sum
  end

  def total_payment
    @total_payment||= self.payments.map { |p| p.complete? ? p.amount : 0 }.sum
  end

  def total_refund
    0.0 # @total_refund ||= self.refunds.map(&:amount).sum
  end

  def total_discount
    0.0 # @total_discount ||= self.discounts.map(&:amount).sum
  end

  def due_balance
    @due_balance ||= total_invoice - total_payment - total_refund - total_discount + (initial_balance || 0)
  end

  def last_payment_date
    payment_date = ''
    payment = payments.where(status: 'complete', is_collection: true).last
    payment_date = payment.date.strftime('%d/%m/%Y') if payment.present?
    payment_date
  end

  def last_any_payment_date
    payment_date = ''
    payment = payments.where(status: 'complete').last
    payment_date = payment.date.strftime('%d/%m/%Y') if payment.present?
    payment_date
  end

  def last_payment_amount
    payment_date = ''
    payment = payments.where(status: 'complete', is_collection: true).last
    payment_date = payment.date if payment.present?
    if payment_date.present?
      @last_payment_amount = payments.where(status: 'complete',
                                            date: payment_date,
                                            is_collection: true).sum(:amount)
    else
      @last_payment_amount = 0
    end
    @last_payment_amount
  end

  def advanced_paid
    invoices.where(is_advance: true).sum(:invoice_total) || 0
  end
end

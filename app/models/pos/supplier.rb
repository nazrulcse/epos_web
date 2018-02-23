class Pos::Supplier < ActiveRecord::Base
  belongs_to :department
  has_many :purchases, :class_name => 'Pos::Suppliers::Purchase', foreign_key: :supplier_id, dependent: :destroy
  has_many :payments, :class_name => 'Pos::Suppliers::Payment', foreign_key: :supplier_id, dependent: :destroy
  has_many :products, :class_name => 'Pos::Product', foreign_key: :supplier_id, dependent: :destroy

  include PublicActivity::Model
  tracked owner: proc { |controller, model| controller.current_employee },
          recipient: proc { |controller, model| controller.current_department }

  after_initialize :init

  def init
    self.initial_balance ||= 0.0
  end

  def active_invoice
    purchases.where(is_complete: false)
  end

  def total_invoice
    @total_invoice ||= purchases.map(&:total).sum
  end

  def total_payment
    @total_payment ||= payments.map { |p| p.complete? ? p.amount : 0 }.sum
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
    payment = payments.where(status: 'complete').last
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
    payment = payments.where(status: 'complete').last
    payment_date = payment.date if payment.present?
    if payment_date.present?
      @last_payment_amount = payments.where(status: 'complete',
                                            date: payment_date).sum(:amount)
    else
      @last_payment_amount = 0
    end
    @last_payment_amount
  end
end

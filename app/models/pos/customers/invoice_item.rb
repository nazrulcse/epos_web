class Pos::Customers::InvoiceItem < ActiveRecord::Base
  belongs_to :department
  belongs_to :product, :class_name => 'Pos::Product'
  belongs_to :invoice, :class_name => 'Pos::Customers::Invoice', foreign_key: :invoice_id

  validates :global_id, uniqueness: true

  after_save :update_to_stock
  before_create :check_invoice

  def update_to_stock
    stock = invoice.stocks.where(product_id: product_id).first
    if stock.present?
      stock.quantity = -quantity
    else
      stock = invoice.stocks.build(product_id: product_id, quantity: -quantity)
    end
    stock.save
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

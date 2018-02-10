class Pos::Customers::InvoiceItem < ActiveRecord::Base
  belongs_to :department
  belongs_to :invoice, :class_name => 'Pos::Customers::Invoice', foreign_key: :invoice_id

  after_save :update_to_stock

  def update_to_stock
    stock = invoice.stocks.where(product_id: product_id).first
    if stock.present?
      stock.quantity = -quantity
    else
      stock = invoice.stocks.build(product_id: product_id, quantity: quantity)
    end
    stock.save
  end
end

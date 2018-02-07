class Pos::Suppliers::PurchaseItem < ActiveRecord::Base
  belongs_to :department
  belongs_to :purchase, :class_name => 'Pos::Suppliers::Purchase', foreign_key: :purchase_id
  belongs_to :product, :class_name => 'Pos::Product', foreign_key: :product_id
  after_save :update_to_stock

  def update_to_stock
    return unless received_quantity.present?
    stock = purchase.stocks.where(product_id: self.product_id).first
    if stock.present?
      stock.quantity = self.received_quantity
    else
      stock = purchase.stocks.build({product_id: self.product_id, quantity: self.received_quantity})
    end
    stock.save
  end
end

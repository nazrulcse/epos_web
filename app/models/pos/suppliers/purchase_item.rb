class Pos::Suppliers::PurchaseItem < ActiveRecord::Base
  belongs_to :department
  belongs_to :purchase, :class_name => 'Pos::Suppliers::Purchase', foreign_key: :purchase_id
  belongs_to :product, :class_name => 'Pos::Product', foreign_key: :product_id

  scope :received, -> { where.not(received_quantity: nil) }

  after_save :update_to_stock

  after_initialize :init

  def init
    self.received_quantity ||= 0
    self.cost_price ||= 0.0
    self.sale_price ||= 0.0
    self.whole_sale ||= 0.0
    self.amount ||= 0.0
    self.discount ||= 0.0
    self.vat ||= 0.0
    self.total ||= 0.0
  end

  def update_to_stock
    return unless received_quantity.present?
    stock = purchase.stocks.where(product_id: product_id).first
    if stock.present?
      stock.quantity = received_quantity
    else
      stock = purchase.stocks.build(product_id: product_id, quantity: received_quantity)
    end
    stock.save
  end

  def avg_cost_price
    (amount + product.cost_price) / 2.0
  end

  def avg_sale_price
    (sale_price + product.sale_price) / 2.0
  end
end

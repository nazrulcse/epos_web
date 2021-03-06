class Pos::Product < ActiveRecord::Base
  belongs_to :department
  belongs_to :category, class_name: 'Pos::Products::Category', foreign_key: :category_id
  belongs_to :sub_category, class_name: 'Pos::Products::SubCategory', foreign_key: :sub_category_id
  belongs_to :supplier, class_name: 'Pos::Supplier', foreign_key: :supplier_id
  belongs_to :model, class_name: 'Pos::Products::Model', foreign_key: :model_id
  belongs_to :brand, class_name: 'Pos::Products::Brand', foreign_key: :brand_id
  has_many :stocks, class_name: 'Pos::Stock', dependent: :destroy
  has_many :purchase_items, class_name: 'Pos::Suppliers::PurchaseItem', dependent: :destroy
  has_many :price_tags, class_name: 'Pos::Products::PriceTag', dependent: :destroy

  attr_reader :stock_on_hand

  validates :code, presence: true, uniqueness: true
  validates :barcode, presence: true, uniqueness: true

  include PublicActivity::Model
  tracked owner: proc { |controller, model| controller.current_employee },
          recipient: proc { |controller, model| controller.current_department }

  after_initialize :init

  def init
    self.re_order_level ||= 0
    self.stock ||= 0
    self.cost_price ||= 0.0
    self.sale_price ||= 0.0
    self.whole_sale ||= 0.0
    self.vat ||= 0.0
    self.discount ||= 0.0
  end

  def self.search(q)
    q.present? ? where('id like :q OR code like :q OR name LIKE :q', q: "%#{q}%") : self.all
  end

  def stock_on_hand
    stock + stocks.sum(:quantity)
  end

  def summary_json
    {
        id: id,
        stock_on_hand: stock_on_hand,
        cost_price: cost_price,
        sale_price: sale_price
    }
  end

  def stock_summary
    real_stock = stock_on_hand
    total_cost = cost_price.to_f * real_stock.to_f
    total_sale = sale_price.to_f * real_stock.to_f
    {
        stock_on_hand: real_stock,
        total_cost: total_cost,
        total_sale: total_sale,
        expected_profit: total_sale - total_cost
    }
  end
end

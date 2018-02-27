class Pos::Stock < ActiveRecord::Base
  belongs_to :product, class_name: 'Pos::Product'
  belongs_to :stockable, polymorphic: true

  def self.summary(products)
    total_quantity = 0
    total_cost = total_sale = total_profit = 0.0
    products.find_each(batch_size: 100) do |product|
      partial_summary = product.stock_summary
      total_quantity += partial_summary[:stock_on_hand]
      total_cost += partial_summary[:total_cost]
      total_sale += partial_summary[:total_sale]
      total_profit += partial_summary[:expected_profit]
    end
    { total_quantity: total_quantity, total_cost: total_cost, total_sale: total_sale, total_profit: total_profit }
  end
end

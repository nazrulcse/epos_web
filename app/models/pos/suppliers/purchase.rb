class Pos::Suppliers::Purchase < ActiveRecord::Base
  belongs_to :department
  belongs_to :issued_employee, class_name: 'Employee', foreign_key: :issued_employee_id
  belongs_to :received_employee, class_name: 'Employee', foreign_key: :received_employee_id
  belongs_to :supplier, class_name: 'Pos::Supplier', foreign_key: :supplier_id
  has_many :items, class_name: 'Pos::Suppliers::PurchaseItem', foreign_key: :purchase_id, dependent: :destroy
  has_many :payments, class_name: 'Pos::Suppliers::Payment', foreign_key: :purchase_id, dependent: :destroy
  has_many :stocks, class_name: 'Pos::Stock', as: :stockable, dependent: :destroy

  accepts_nested_attributes_for :items,
                                :allow_destroy => true,
                                :reject_if => proc { |attributes|
                                  attributes.all? { |k, v| v.blank? }
                                }

  def total_refund
    0.0 # refunds.sum(:amount)
  end

  def total_discount
    0.0 # discounts.sum(:amount)
  end

  def paid
    payments.sum(:amount)
  end

  def due_amount
    total - payments.sum(:amount)
  end

  def self.active_purchase_supplier(department)
    supplier_ids = where(supplier_id: department.suppliers.map(&:id), is_complete: false).map(&:supplier_id)
    Pos::Supplier.where(id: supplier_ids)
  end

  def update_product_price(option)
    items.each do |item|
      if option == 'update_all'
        new_cost_price = item.amount
        new_sale_price = item.amount
      else
        new_cost_price = item.avg_cost_price
        new_sale_price = item.avg_sale_price
      end
      item.product.update_attributes(cost_price: new_cost_price, sale_price: new_sale_price)
    end
  end

end

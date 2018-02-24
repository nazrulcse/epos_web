class Pos::Products::PriceTag < ActiveRecord::Base
  belongs_to :product, class_name: 'Pos::Product'
  belongs_to :department

  validates :barcode, presence: true, uniqueness: true
  validates :sale_price, presence: true

  include PublicActivity::Model
  tracked owner: proc { |controller, model| controller.current_employee },
          recipient: proc { |controller, model| controller.current_department }

  after_destroy :remove_queue_codes

  def remove_queue_codes
    queue_codes = Pos::Products::QueueCode.where(department_id: department_id, barcode: barcode, product_id: product_id)
    queue_codes.delete_all if queue_codes.present?
  end
end

class Pos::Products::PriceTag < ActiveRecord::Base
  belongs_to :product, :class_name => 'Pos::Product'
  belongs_to :department

  include PublicActivity::Model
  tracked owner: proc { |controller, model| controller.current_employee },
          recipient: proc { |controller, model| controller.current_department }
end

class Pos::Products::QueueCode < ActiveRecord::Base
  belongs_to :department
  belongs_to :product, class_name: 'Pos::Product'
end

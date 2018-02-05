class Pos::Stock < ActiveRecord::Base
  belongs_to :products, :class_name => 'Pos::Products'
  belongs_to :stockable, polymorphic: true
end

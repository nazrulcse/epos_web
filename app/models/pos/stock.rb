class Pos::Stock < ActiveRecord::Base
  belongs_to :product, :class_name => 'Pos::Products'
  belongs_to :stockable, polymorphic: true
end

class Pos::Products::Brand < ActiveRecord::Base
  belongs_to :department
  has_many :products, :class_name => 'Pos::Product', foreign_key: :brand_id
end

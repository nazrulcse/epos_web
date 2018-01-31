class Pos::Products::SubCategory < ActiveRecord::Base
  belongs_to :department
  belongs_to :category, :class_name => 'Pos::Products::Category'
  has_many :products, :class_name => 'Pos::Product', foreign_key: :sub_category_id
end

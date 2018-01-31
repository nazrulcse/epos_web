class Pos::Products::Category < ActiveRecord::Base
  belongs_to :department
  has_many :sub_categories, :class_name => 'Pos::Products::SubCategory'
  has_many :products, :class_name => 'Pos::Product', foreign_key: :category_id
end

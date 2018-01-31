class Pos::Product < ActiveRecord::Base
  belongs_to :department
  belongs_to :category, :class_name => 'Pos::Products::Category', foreign_key: :category_id
  belongs_to :sub_category, :class_name => 'Pos::Products::SubCategory', foreign_key: :sub_category_id
  belongs_to :supplier, :class_name => 'Pos::Supplier', foreign_key: :supplier_id
  belongs_to :model, :class_name => 'Pos::Products::Model', foreign_key: :model_id
  belongs_to :brand, :class_name => 'Pos::Products::Brand', foreign_key: :brand_id
end

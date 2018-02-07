class Pos::Products::Model < ActiveRecord::Base
  belongs_to :department
  has_many :products, :class_name => 'Pos::Product', foreign_key: :model_id, dependent: :destroy
end

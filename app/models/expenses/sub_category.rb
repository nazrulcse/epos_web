class Expenses::SubCategory < ActiveRecord::Base
  belongs_to :category, class_name: 'Expenses::Category'
  has_many :expenses, dependent: :destroy
end

class Expenses::Group < ActiveRecord::Base
  belongs_to :department
  has_many :categories, class_name: 'Expenses::Category', dependent: :destroy
end

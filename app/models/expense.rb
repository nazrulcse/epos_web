class Expense < ActiveRecord::Base
  belongs_to :department
  belongs_to :category, class_name: 'Expenses::Category'
  belongs_to :sub_category, class_name: 'Expenses::SubCategory'
  belongs_to :employee, foreign_key: :created_by

  attr_accessor :to_owner

  validates :category_id, :amount, presence: true

  mount_uploader :image, ImageUploader
end

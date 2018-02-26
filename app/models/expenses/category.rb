class Expenses::Category < ActiveRecord::Base
  belongs_to :department
  belongs_to :group, class_name: 'Expenses::Group'
  has_many :sub_categories, class_name: 'Expenses::SubCategory', dependent: :destroy
  has_many :expenses, dependent: :destroy

  validates :department_id, :name, presence: true
end

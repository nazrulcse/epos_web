class Pos::Customers::Category < ActiveRecord::Base
  belongs_to :department
  has_many :customers, :class_name => 'Pos::Customer'
end

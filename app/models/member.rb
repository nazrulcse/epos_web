class Member < ActiveRecord::Base
  belongs_to :company

  validates :code, presence: true, uniqueness: true
  validates_presence_of :name, :email, :mobile
end

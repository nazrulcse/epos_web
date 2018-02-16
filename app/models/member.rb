class Member < ActiveRecord::Base
  belongs_to :company

  validates :code, presence: true, uniqueness: true
  validates_presence_of :name, :email, :mobile

  include PublicActivity::Common

  after_initialize :init

  def init
    self.last_point ||= 0.0
  end
end

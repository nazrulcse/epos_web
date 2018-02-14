class Pos::Customers::Payment < ActiveRecord::Base
  belongs_to :department
  belongs_to :cashier, class_name: 'Employee'
  belongs_to :collected_by, class_name: 'Employee'
  belongs_to :bank_account, class_name: 'Bank::Account'
  belongs_to :invoice, class_name: 'Pos::Customers::Invoice', foreign_key: :invoice_id
  belongs_to :customer, class_name: 'Pos::Customer', foreign_key: :customer_id

  validates :global_id, uniqueness: true

  after_save :set_global_id

  private

  def set_global_id
    update_attributes(global_id: "web-#{department.company.id}-#{department.id}-#{id}") unless global_id.present?
  end
end

class AddColumnCreditLimitToPosCustomers < ActiveRecord::Migration
  def change
    add_column :pos_customers, :credit_limit, :float
  end
end

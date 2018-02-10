class AddColumnCategoryIdToPosCustomers < ActiveRecord::Migration
  def change
    add_reference :pos_customers, :category, references: :pos_customers_category, index: true
    add_foreign_key :pos_customers, :pos_customers_categories, column: :category_id
  end
end

class ChangeTableAttributesDataTypeDecimalToFlat < ActiveRecord::Migration
  def change
    change_column :settings, :working_hours, :float
    change_column :employees, :basic_salary, :float
    change_column :features, :cost, :float
  end
end

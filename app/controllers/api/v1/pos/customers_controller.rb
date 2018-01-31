class Api::V1::Pos::CustomersController < Api::V1::V1Base
  def index
    department = Department.find(params[:department_id])
    @customers = department.customers
  end
end

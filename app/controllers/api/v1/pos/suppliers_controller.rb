class Api::V1::Pos::SuppliersController < Api::V1::V1Base
  def index
    department = Department.find(params[:department_id])
    @suppliers = department.suppliers
  end
end

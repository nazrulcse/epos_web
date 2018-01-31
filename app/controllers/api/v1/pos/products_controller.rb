class Api::V1::Pos::ProductsController < Api::V1::V1Base
  def index
    department = Department.find(params[:department_id])
    @products = department.products
  end
end

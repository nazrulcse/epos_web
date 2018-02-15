class Api::V1::DepartmentsController < Api::V1::V1Base

  def index
    department = Department.find(params[:department_id])
    @departments = department.company.departments
  end
end

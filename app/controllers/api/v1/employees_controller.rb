class Api::V1::EmployeesController < Api::V1::V1Base

  before_action :set_employee, only: :show

  def index
    department = Department.includes(employees: :designation).find(params[:department_id])
    @employees = department.employees
  end

  def show
    json_response(@employee)
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end
end

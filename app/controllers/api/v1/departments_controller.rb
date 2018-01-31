class Api::V1::DepartmentsController < Api::V1::V1Base

  def index
    company = Company.includes(:departments).find(params[:company_id])
    @departments = company.departments
  end
end

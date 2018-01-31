class Api::V1::DesignationsController < Api::V1::V1Base
  #before_action :set_designation

  def index
    department = Department.includes(:designations).find(params[:department_id])
    @designations = department.designations
  end

  private

  def set_designation
    @designation = Designation.find(params[:id])
  end
end

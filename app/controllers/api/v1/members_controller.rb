class Api::V1::MembersController < Api::V1::V1Base
  def index
    department = Department.find(params[:department_id])
    @members = department.company.members
  end
end

class Api::V1::MembersController < Api::V1::V1Base
  def index
    company = Company.find(params[:company_id])
    @members = company.members
  end
end

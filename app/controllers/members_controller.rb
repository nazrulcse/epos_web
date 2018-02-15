class MembersController < InheritedResources::Base
  before_action :set_member, only: [:show, :edit, :update, :delete]

  def index
    @members = current_company.members
  end

  def show

  end

  def new
    @member = Member.new
  end

  def create
    @member = current_company.members.build(member_params)

    if @member.save
      @member.create_activity key: 'member.create', owner: current_employee, recipient: current_company
      flash[:notice] = 'Member saved successfully.'
    else
      flash[:danger] = errors_to_message_string(@member.errors)
    end

    redirect_to members_path
  end

  def edit

  end

  def update
    if @member.update(member_params)
      @member.create_activity key: 'member.update', owner: current_employee, recipient: current_company
      flash[:notice] = 'Member info updated successfully.'
    else
      flash[:danger] = errors_to_message_string(@member.errors)
    end
    redirect_to members_path
  end

  def delete
    if @member.destroy
      @member.create_activity key: 'member.destroy', owner: current_employee, recipient: current_company
      flash[:notice] = 'Member deleted successfully.'
    else
      flash[:danger] = errors_to_message_string(@member.errors)
    end
    redirect_to members_path
  end

  private

  def set_member
    @member = current_company.members.find(params[:id])
  end

  def member_params
    params.require(:member).permit!
  end
end


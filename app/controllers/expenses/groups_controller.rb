class Expenses::GroupsController < ApplicationController
  before_filter :current_ability
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = current_department.expenses_groups
  end

  def new
    @group = Expenses::Group.new
  end

  def create
    @group = current_department.expenses_groups.build(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to expenses_groups_path, notice: 'Expense Group saved successfully.' }
      else
        format.html { redirect_to expenses_groups_path, danger: errors_to_message_string(@group.errors) }
      end
      format.js {}
    end
  end

  def edit

  end

  def update
    if @group.update(group_params)
      flash[:notice] = 'Expense group info updated successfully.'
    else
      flash[:error] = errors_to_message_string(@group.errors)
    end
    redirect_to expenses_groups_path
  end

  def destroy
    if @group.destroy
      flash[:notice] = 'Group deleted successfully.'
    else
      flash[:danger] = errors_to_message_string(@group.errors)
    end
    redirect_to expenses_groups_path
  end

  private

  def set_group
    @group = Expenses::Group.find(params[:id])
  end

  def group_params
    params.require(:expenses_group).permit!
  end
end

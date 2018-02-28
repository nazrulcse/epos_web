class ExpensesController < ApplicationController
  before_filter :current_ability
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  def index
    @expenses = current_department.expenses
  end

  def show
  end

  def new
    @expense = Expense.new
    @categories = current_department.expenses_categories
    @sub_categories = @categories.present? ? @categories.first.sub_categories : []
  end

  def create
    @expense = current_department.expenses.build(expense_params)
    @expense.created_by = current_employee.id
    respond_to do |format|
      if @expense.save
        format.html { redirect_to expenses_path, notice: 'Expense saved successfully.' }
      else
        format.html { redirect_to expenses_path, error: 'Expense saving failed.' }
      end
      format.js {}
    end
  end

  def edit
    @categories = current_department.expenses_categories
    @sub_categories = @expense.category.sub_categories
  end

  def update
    if @expense.update(expense_params)
      flash[:notice] = 'Expense info updated successfully.'
    else
      flash[:error] = 'Expense info update failed.'
    end
    redirect_to expenses_path
  end

  def destroy
    if @expense.destroy
      flash[:notice] = 'Expense deleted successfully.'
    else
      flash[:error] = 'Expense deletion failed.'
    end
    redirect_to expenses_path
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit!
  end
end

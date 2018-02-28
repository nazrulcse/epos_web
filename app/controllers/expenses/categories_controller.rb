class Expenses::CategoriesController < ApplicationController
  before_filter :current_ability
  before_action :set_category, only: [:edit, :update, :delete, :sub_cats]

  def index
    @categories = current_department.expenses_categories
  end

  def new
    @category = Expenses::Category.new
    @groups = current_department.expenses_groups
  end

  def create
    @category = current_department.expenses_categories.build(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to expenses_categories_path, notice: 'Expense Category saved successfully.' }
      else
        format.html { redirect_to expenses_categories_path, error: 'Expense Category saving failed.' }
      end
      format.js {}
    end
  end

  def edit

  end

  def update
    if @category.update(category_params)
      flash[:notice] = 'Expense Category info updated successfully.'
    else
      flash[:error] = 'Expense Category info update failed.'
    end
    redirect_to expenses_categories_path
  end

  def delete
    if @category.destroy
      flash[:notice] = 'Expense Category deleted successfully.'
    else
      flash[:error] = 'Expense Category deletion failed.'
    end
    redirect_to expenses_categories_path
  end

  def sub_cats
    @sub_categories = @category.sub_categories
  end

  private

  def set_category
    @category = Expenses::Category.find(params[:id])
  end

  def category_params
    params.require(:expenses_category).permit!
  end
end

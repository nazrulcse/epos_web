class Expenses::SubCategoriesController < ApplicationController
  before_filter :current_ability
  before_action :set_category
  before_action :set_sub_category, only: [:edit, :update, :destroy]

  def index
    @sub_categories = @category.sub_categories
  end

  def new
    @sub_category = @category.sub_categories.build
  end

  def create
    @sub_category = @category.sub_categories.build(sub_category_params)

    respond_to do |format|
      if @sub_category.save
        format.html { redirect_to expenses_category_sub_categories_path(@category), notice: 'Expense Sub-Category saved successfully.' }
      else
        format.html { redirect_to expenses_category_sub_categories_path(@category), error: errors_to_message_string(@sub_category) }
      end
      format.js {}
    end
  end

  def edit
  end

  def update
    if @sub_category.update(sub_category_params)
      flash[:notice] = 'Expense Sub-Category info updated successfully.'
    else
      flash[:error] = 'Expense Sub-Category info update failed.'
    end
    redirect_to expenses_category_sub_categories_path(@category)
  end

  def destroy
    if @sub_category.destroy
      flash[:notice] = 'Expense Sub-Category deleted successfully.'
    else
      flash[:error] = 'Expense Sub-Category deletion failed.'
    end
    redirect_to expenses_category_sub_categories_path(@category)
  end

  private

  def set_category
    @category = Expenses::Category.find(params[:category_id])
  end

  def set_sub_category
    @sub_category = @category.sub_categories.find(params[:id])
  end

  def sub_category_params
    params.require(:expenses_sub_category).permit!
  end
end

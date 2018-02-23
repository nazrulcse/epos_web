class Pos::Customers::CategoriesController < InheritedResources::Base
  before_filter :current_ability
  before_action :set_category, only: [:edit, :update, :delete]

  def index
    @categories = current_department.customers_categories
  end

  def new
    @category = Pos::Customers::Category.new
  end

  def create
    @category = current_department.customers_categories.build(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to pos_customers_categories_path, notice: 'customer Category saved successfully.' }
      else
        format.html { redirect_to pos_customers_categories_path, error: 'customer Category saving failed.' }
      end
    end
  end

  def edit

  end

  def update
    if @category.update(category_params)
      flash[:notice] = 'customer Category info updated successfully.'
    else
      flash[:error] = 'customer Category info update failed.'
    end
    redirect_to pos_customers_categories_path
  end

  def delete
    if @category.destroy
      flash[:notice] = 'customer Category deleted successfully.'
    else
      flash[:error] = 'customer Category deletion failed.'
    end
    redirect_to pos_customers_categories_path
  end

  private

  def set_category
    @category = Pos::Customers::Category.find(params[:id])
  end

  def category_params
    params.require(:pos_customers_category).permit!
  end
end


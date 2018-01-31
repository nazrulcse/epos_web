class Pos::Products::SubCategoriesController < InheritedResources::Base
  before_action :set_sub_category, only: [:edit, :update, :delete]

  def index
    @sub_categories = current_department.products_sub_categories
  end

  def new
    @sub_category = Pos::Products::SubCategory.new
    @categories = current_department.products_categories
  end

  def create
    @sub_category = current_department.products_sub_categories.build(sub_category_params)

    if @sub_category.save
      flash[:notice] = 'Product Sub-Category saved successfully.'
    else
      flash[:error] = 'Product Sub-Category saving failed.'
    end

    redirect_to pos_products_sub_categories_path
  end

  def edit
    @categories = current_department.products_categories
  end

  def update
    if @sub_category.update(sub_category_params)
      flash[:notice] = 'Product Sub-Category info updated successfully.'
    else
      flash[:error] = 'Product Sub-Category info update failed.'
    end
    redirect_to pos_products_sub_categories_path
  end

  def delete
    if @sub_category.destroy
      flash[:notice] = 'Product Sub-Category deleted successfully.'
    else
      flash[:error] = 'Product Sub-Category deletion failed.'
    end
    redirect_to pos_products_sub_categories_path
  end

  private

  def set_sub_category
    @sub_category = Pos::Products::SubCategory.find(params[:id])
  end

  def sub_category_params
    params.require(:pos_products_sub_category).permit!
  end
end


class Pos::Products::SubCategoriesController < InheritedResources::Base
  before_filter :current_ability
  before_action :set_sub_category, only: [:edit, :update, :delete]

  def index
    @sub_categories = current_department.products_sub_categories
  end

  def new
    @sub_category = Pos::Products::SubCategory.new(code: "SC000#{current_department.brands.count + 1}")
    if params[:category_id].present?
      @category = Pos::Products::Category.find(params[:category_id])
    else
      @categories = current_department.products_categories
    end
  end

  def create
    @sub_category = current_department.products_sub_categories.build(sub_category_params)

    respond_to do |format|
      if @sub_category.save
        format.html { redirect_to pos_products_sub_categories_path, notice: 'Product Sub-Category saved successfully.' }
      else
        format.html { redirect_to pos_products_sub_categories_path, error: 'Product Sub-Category saving failed.' }
      end
      format.js {}
    end
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


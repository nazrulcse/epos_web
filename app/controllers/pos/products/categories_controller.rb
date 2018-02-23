class Pos::Products::CategoriesController < InheritedResources::Base
  before_action :set_category, only: [:edit, :update, :delete, :sub_categories]

  def index
    @categories = current_department.products_categories
  end

  def new
    cat_code = "PC#{current_department.id}000#{current_department.products_categories.count + 1}"
    @category = Pos::Products::Category.new({code: cat_code})
  end

  def create
    @category = current_department.products_categories.build(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to pos_products_categories_path, notice: 'Product Category saved successfully.' }
      else
        format.html { redirect_to pos_products_categories_path, error: 'Product Category saving failed.' }
      end
      format.js {}
    end
  end

  def edit

  end

  def update
    if @category.update(category_params)
      flash[:notice] = 'Product Category info updated successfully.'
    else
      flash[:error] = 'Product Category info update failed.'
    end
    redirect_to pos_products_categories_path
  end

  def delete
    if @category.destroy
      flash[:notice] = 'Product Category deleted successfully.'
    else
      flash[:error] = 'Product Category deletion failed.'
    end
    redirect_to pos_products_categories_path
  end

  def sub_categories
    @sub_categories = @category.sub_categories
    p @sub_categories
    respond_to do |format|
      format.js {}
    end
  end

  private

  def set_category
    @category = Pos::Products::Category.find(params[:id])
  end

  def category_params
    params.require(:pos_products_category).permit!
  end
end


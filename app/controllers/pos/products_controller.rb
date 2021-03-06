class Pos::ProductsController < InheritedResources::Base
  before_filter :current_ability
  before_action :set_product, only: [:show, :edit, :update, :delete]

  def index
    @products = current_department.products.search(params[:q])
  end

  def show
    respond_to do |format|
      format.html {
        @price_tags = @product.price_tags
        @purchase_items = @product.purchase_items.includes(:purchase).where.not(received_quantity: nil)
      }
      format.json {
        render json: @product.summary_json
      }
    end
  end

  def new
    product_code = "P#{current_department.id}000#{current_department.products.count + 1}"
    @product = Pos::Product.new(code: product_code)
    @categories = current_department.products_categories
    @sub_categories = @categories.present? ? @categories.first.sub_categories : []
    @suppliers = current_department.suppliers
    @brands = current_department.brands
    @models = current_department.models
  end

  def create
    @product = current_department.products.build(product_params)

    if @product.save
      flash[:notice] = 'Product saved successfully.'
    else
      flash[:danger] = errors_to_message_string(@product.errors)
    end

    redirect_to pos_products_path
  end

  def edit
    @categories = current_department.products_categories
    @sub_categories = @product.category.sub_categories
    @suppliers = current_department.suppliers
    @brands = current_department.brands
    @models = current_department.models
  end

  def update
    if @product.update(product_params)
      flash[:notice] = 'Product info updated successfully.'
    else
      flash[:danger] = errors_to_message_string(@product.errors)
    end
    redirect_to pos_products_path
  end

  def delete
    if @product.destroy
      flash[:notice] = 'Product deleted successfully.'
    else
      flash[:error] = 'Product deletion failed.'
    end
    redirect_to pos_products_path
  end

  private

  def set_product
    @product = Pos::Product.find(params[:id])
  end

  def product_params
    params.require(:pos_product).permit!
  end
end


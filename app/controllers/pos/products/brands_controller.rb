class Pos::Products::BrandsController < InheritedResources::Base
  before_action :set_brand, only: [:show, :edit, :update, :delete]

  def index
    @brands = current_department.brands
  end

  def show

  end

  def new
    @brand = Pos::Products::Brand.new
  end

  def create
    @brand = current_department.brands.build(brand_params)

    respond_to do |format|
      if @brand.save
        format.html { redirect_to pos_products_brands_path, notice: 'Brand saved successfully.' }
      else
        format.html { redirect_to pos_products_brands_path, danger: errors_to_message_string(@brand.errors) }
      end
      format.js {}
    end
  end

  def edit

  end

  def update
    if @brand.update(brand_params)
      flash[:notice] = 'Brand info updated successfully.'
    else
      flash[:error] = errors_to_message_string(@brand.errors)
    end
    redirect_to pos_products_brands_path
  end

  def delete
    if @brand.destroy
      flash[:notice] = 'Brand deleted successfully.'
    else
      flash[:danger] = errors_to_message_string(@brand.errors)
    end
    redirect_to pos_products_brands_path
  end

  private

  def set_brand
    @brand = Pos::Products::Brand.find(params[:id])
  end

  def brand_params
    params.require(:pos_products_brand).permit!
  end
end


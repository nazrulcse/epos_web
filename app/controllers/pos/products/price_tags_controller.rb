class Pos::Products::PriceTagsController < InheritedResources::Base
  before_filter :current_ability
  before_action :set_price_tag, only: [:show, :edit, :update, :destroy]

  def show

  end

  def new
    @price_tag = Pos::Products::PriceTag.new
  end

  def create
    @price_tag = current_department.product_price_tags.build(price_tag_params)
    @price_tag.save
  end

  def edit
  end

  def update
    @price_tag.update(price_tag_params)
  end

  def destroy
    @product = current_department.products.find(@price_tag.product_id)
    if @price_tag.destroy
      flash[:notice] = 'Deleted successfully.'
    else
      flash[:danger] = errors_to_message_string(@price_tag.errors)
    end
    redirect_to pos_product_path(@product)
  end

  private

  def set_price_tag
    @price_tag = Pos::Products::PriceTag.find(params[:id])
  end

  def price_tag_params
    params.require(:pos_products_price_tag).permit!
  end
end

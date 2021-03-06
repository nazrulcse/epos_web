class Pos::Suppliers::PurchasesController < InheritedResources::Base
  before_filter :current_ability
  before_action :set_purchase, only: [:show, :edit, :update, :delete, :receive]

  def index
    @purchases = current_department.suppliers_purchases.order(id: :desc)
  end

  def show
    respond_to do |format|
      format.html {
        @purchase_items = @purchase.items
      }
      format.json {
        render json: @product.to_json
      }
    end
  end

  def new
    @purchase = Pos::Suppliers::Purchase.new
    @suppliers = current_department.suppliers
    @supplier = @suppliers.find_by_id(params[:supplier_id]) if params[:supplier_id]
  end

  def create
    @purchase = current_department.suppliers_purchases.build(purchase_params)

    if @purchase.save
      flash[:notice] = 'Purchase order saved successfully.'
    else
      flash[:error] = 'Purchase order saving failed.'
    end
    redirect_to pos_suppliers_purchases_path
  end

  def edit
    @suppliers = current_department.suppliers
    @supplier = @purchase.supplier
  end

  def receive
    @supplier = @purchase.supplier
  end

  def update
    if @purchase.update(purchase_params)
      @purchase.update_product_price(params[:price_option]) if params[:price_option].present? && ['update_all', 'average'].include?(params[:price_option])
      flash[:notice] = 'Purchase order updated successfully.'
    else
      flash[:error] = 'Purchase order update failed.'
    end
    redirect_to pos_suppliers_purchases_path
  end

  def delete
    if @purchase.destroy
      flash[:notice] = 'Purchase order deleted successfully.'
    else
      flash[:error] = 'Purchase order deletion failed.'
    end
    redirect_to pos_suppliers_purchases_path
  end

  def history
    if params[:purchase_id].present?
      @purchase = Pos::Suppliers::Purchase.find(params[:purchase_id])
    else
      @product = Pos::Product.find(params[:product_id])
      @purchase_items = @product.purchase_items.includes(:purchase).received
    end
  end

  private

  def set_purchase
    @purchase = Pos::Suppliers::Purchase.find(params[:id])
  end

  def purchase_params
    params.require(:pos_suppliers_purchase).permit!
  end
end


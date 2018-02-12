class Pos::Products::QueueCodesController < InheritedResources::Base
  before_action :set_queue_code, only: [:show, :edit, :update, :delete]

  def index
    @queue_codes = current_department.queue_codes
  end

  def show
  end

  def new
    @queue_code = Pos::Products::QueueCode.new
    if params[:product_id].present?
      @product = current_department.products.find(params[:product_id])
    else
      @products = current_department.products
    end
  end

  def create
    @queue_code = current_department.queue_codes.build(queue_code_params)

    respond_to do |format|
      if @queue_code.save
        format.html { redirect_to pos_products_queue_codes_path, notice: 'Product added to queue.' }
      else
        format.html { redirect_to pos_products_queue_codes_path, error: 'Addition failed.' }
      end
      format.js {}
    end
  end

  def edit
    @products = current_department.products
  end

  def update
    if @queue_code.update(queue_code_params)
      flash[:notice] = 'Queue updated successfully.'
    else
      flash[:error] = 'Queue update failed.'
    end
    redirect_to pos_products_queue_codes_path
  end

  def delete
    if @queue_code.destroy
      flash[:notice] = 'Product deleted from queue.'
    else
      flash[:error] = 'Deletion failed.'
    end
    redirect_to pos_products_queue_codes_path
  end

  private

  def set_queue_code
    @queue_code = Pos::Products::QueueCode.find(params[:id])
  end

  def queue_code_params
    params.require(:pos_products_queue_code).permit!
  end
end

class Pos::Products::QueueCodesController < InheritedResources::Base
  require 'barby'
  require 'chunky_png'
  require 'barby/barcode/code_128'
  require 'barby/outputter/png_outputter'

  before_action :set_queue_code, only: [:show, :edit, :update, :delete]

  def index
    @queue_codes = current_department.queue_codes.includes(:product)
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
        format.html { redirect_to params[:print].present? ? print_barcode_pos_products_queue_codes_path : pos_products_queue_codes_path, notice: 'Product added to queue.' }
      else
        format.html { redirect_to pos_products_queue_codes_path, danger: 'Addition failed.' }
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
      flash[:danger] = 'Queue update failed.'
    end
    redirect_to pos_products_queue_codes_path
  end

  def delete
    if @queue_code.destroy
      flash[:notice] = 'Product deleted from queue.'
    else
      flash[:danger] = 'Deletion failed.'
    end
    redirect_to pos_products_queue_codes_path
  end

  def print_barcode
    @barcode_images = {}
    @queue_codes = current_department.queue_codes.includes(:product)
    @queue_codes.each do |queue_code|
      if queue_code.product.present? && queue_code.product.barcode.present?
        barcode = Barby::Code128B.new(queue_code.product.barcode).to_png(margin: 2, height: 30, width: 150)
        @barcode_images[queue_code.id] = Base64.encode64(barcode.to_s).gsub(/\s+/, "")
      end
    end
    render layout: 'print'
  end

  private

  def set_queue_code
    @queue_code = Pos::Products::QueueCode.find(params[:id])
  end

  def queue_code_params
    params.require(:pos_products_queue_code).permit!
  end
end

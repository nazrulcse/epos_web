class Pos::Customers::InvoicesController < InheritedResources::Base
  before_action :set_invoice, only: [:show, :edit, :update, :delete]

  def index
    @invoices = current_department.customers_invoices
  end

  def show

  end

  def new
    @invoice = Pos::Customers::Invoice.new
  end

  def create
    @invoice = current_department.customers_invoices.build(invoice_params)

    if @invoice.save
      flash[:notice] = 'Customer invoice saved successfully.'
    else
      flash[:error] = 'Customer invoice saving failed.'
    end

    redirect_to pos_customers_invoices_path
  end

  def edit

  end

  def update
    if @invoice.update(invoice_params)
      flash[:notice] = 'Customer invoice updated successfully.'
    else
      flash[:error] = 'Customer invoice update failed.'
    end
    redirect_to pos_customers_invoices_path
  end

  def delete
    if @invoice.destroy
      flash[:notice] = 'Customer invoice deleted successfully.'
    else
      flash[:error] = 'Customer invoice deletion failed.'
    end
    redirect_to pos_customers_invoices_path
  end

  private

  def set_invoice
    @invoice = Pos::Customers::Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:pos_customers_invoice).permit!
  end
end


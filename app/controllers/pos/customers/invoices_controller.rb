class Pos::Customers::InvoicesController < InheritedResources::Base
  before_action :set_invoice, only: [:show, :edit, :update, :delete]

  def index
    @invoices = current_department.customers_invoices
  end

  def show
    @invoice_items = @invoice.items
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

  def close_invoice
    @invoices = params[:advance_amount]
    @invoices.each do |key, value|
      if value.to_f > 0
        @invoice = Pos::Customers::Invoice.find_by_id(key)
        remaining_amount = @invoice.amount.to_f - @invoice.advance_paid.to_f
        if remaining_amount == value.to_f
          @invoice.is_complete = true
        elsif value.to_f > remaining_amount
          @invoice.is_advance = true
          extra_amount = value.to_f - remaining_amount
          @invoice.amount += extra_amount
          @invoice.advance_paid = @invoice.amount
          Pos::Customers::Payment.create(amount: extra_amount, collected_by_id: current_employee.id, customer_id: @invoice.customer_id, method: 'cash', date: Date.today, value_date: Date.today)
        else
          @invoice.advance_paid = value
        end
        @invoice.save
      end
    end
  end

  def history
    @invoice = Customers::Invoice.find_by_id(params[:invoice_id])
  end

  private

  def set_invoice
    @invoice = Pos::Customers::Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:pos_customers_invoice).permit!
  end
end


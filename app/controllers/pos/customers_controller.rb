class Pos::CustomersController < InheritedResources::Base

  before_action :set_customer, only: [:show, :edit, :update, :delete]

  def index
    @customers = current_department.customers
  end

  def show

  end

  def new
    @customer = Pos::Customer.new
    @categories = current_department.customers_categories
  end

  def create
    @customer = current_department.customers.build(customer_params)

    if @customer.save
      flash[:notice] = 'Customer saved successfully.'
    else
      flash[:error] = 'Customer saving failed.'
    end

    redirect_to pos_customers_path
  end

  def edit
    @categories = current_department.customers_categories
  end

  def update
    if @customer.update(customer_params)
      flash[:notice] = 'Customer info updated successfully.'
    else
      flash[:error] = 'Customer info update failed.'
    end
    redirect_to pos_customers_path
  end

  def delete
    if @customer.destroy
      flash[:notice] = 'Customer deleted successfully.'
    else
      flash[:error] = 'Customer deletion failed.'
    end
    redirect_to pos_customers_path
  end

  def process_invoice
    payment_method = params['payment_method']
    @response = "<ul class='invoice-payment-message'>"

    payment_method.each do |key, value|
      if value.present?
        invoice = Pos::Customers::Invoice.find(key)
        payment = invoice.payments.build(customer_id: params['customer_id'])
        if params['invoice_pay'].present? && params['invoice_pay'][key].present?
          payment.amount = invoice.due_amount
        else
          payment.amount = params['invoice_amount'][key]
        end
        if payment.amount && payment.amount > 1
          payment.collected_by_id = params['collected_by_id']
          payment.cashier_id = params['cashier_id']
          payment.method = value
          payment.commission = params['invoice_commission'][key]
          payment.date = Date.parse(params[:received_date]) || Date.today
          payment.is_collection = (params['is_collection'].present? && params['is_collection'][key].present?)
          if value == 'cheque'
            if params[:payment_type] == 'Group Payment'
              payment.bank_account_id = params['group_bank_account']
              payment.value_date = Date.parse(params['group_date'])
              payment.cheque_number = params['group_cheque_number']
              payment.bank_name = params['group_bank_name']
              payment.bank_branch = params['group_bank_branch']
              payment.is_group = true
            else
              payment.bank_account_id = params['bank_account'][key]
              payment.value_date = Date.parse(params['value_date'][key])
              payment.cheque_number = params['cheque_number'][key]
              payment.bank_name = params['bank_name'][key]
              payment.bank_branch = params['bank_branch'][key]
            end

            if params['account_payable'].present?
              payment.account_payable = true
            else
              payment.account_payable = false
            end
          end
          if payment.save
            if invoice.due_amount <= 1
              invoice.is_complete = true
              invoice.save
            end
            @response << "<li> Payment #{view_context.link_to "##{payment.id}", pos_customers_payment_path(payment.id)} for invoice: ##{key} success with amount #{payment.amount} </li>"
          else
            puts error_messages(payment)
            @response << "<li> Payment #{payment.amount} for invoice: ##{key} failed error: <span class='color-red'> #{error_messages(payment)} </span> </li>"
          end
        end
      end
    end
    redirect_to new_pos_customers_payment_path(customer_id: params['customer_id']), notice: @response << '</ul>'
  end

  private

  def set_customer
    @customer = Pos::Customer.find(params[:id])
  end

  def customer_params
    params.require(:pos_customer).permit!
  end
end


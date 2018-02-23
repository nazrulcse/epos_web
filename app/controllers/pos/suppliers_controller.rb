class Pos::SuppliersController < InheritedResources::Base
  before_filter :current_ability
  before_action :set_supplier, only: [:show, :edit, :update, :delete, :history, :print_voucher]

  def index
    @suppliers = current_department.suppliers
  end

  def show

  end

  def new
    @supplier = Pos::Supplier.new
  end

  def create
    @supplier = current_department.suppliers.build(supplier_params)

    if @supplier.save
      flash[:notice] = 'Supplier saved successfully.'
    else
      flash[:error] = 'Supplier saving failed.'
    end

    redirect_to pos_suppliers_path
  end

  def edit

  end

  def update
    if @supplier.update(supplier_params)
      flash[:notice] = 'Supplier info updated successfully.'
    else
      flash[:error] = 'Supplier info update failed.'
    end
    redirect_to pos_suppliers_path
  end

  def delete
    if @supplier.destroy
      flash[:notice] = 'Supplier deleted successfully.'
    else
      flash[:error] = 'Supplier deletion failed.'
    end
    redirect_to pos_suppliers_path
  end

  def history
  end

  def process_purchase
    payment_method = params['payment_method']
    @response = "<ul class='invoice-payment-message'>"
    payment_method.each do |key, value|
      if value.present?
        purchase = Pos::Suppliers::Purchase.find(key)
        payment = purchase.payments.build(supplier_id: params['supplier_id'])
        if params['invoice_pay'].present? && params['invoice_pay'][key].present?
          payment.amount = purchase.due_amount
        else
          payment.amount = params['invoice_amount'][key]
        end
        if payment.amount && payment.amount > 1
          payment.commission = params['invoice_commission'][key]
          payment.paid_by_id = params['cashier_id']
          payment.paid_to = params['paid_to']
          payment.payment_method = value
          payment.date = Date.parse(params[:received_date]) || Date.today
          if value == 'cheque'
            if params[:payment_type] == 'Group Payment'
              payment.bank_account_id = params['group_bank_account']
              payment.value_date = Date.parse(params['group_value_date'])
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

          end
          if payment.save
            if purchase.due_amount <= 1
              purchase.is_complete = true
              purchase.save
            end
            @response << "<li> Payment #{view_context.link_to "##{payment.id}", pos_suppliers_payment_path(payment.id)} for invoice: ##{key} success with amount #{payment.amount} </li>"
          else
            puts error_messages(payment)
            @response << "<li> Payment #{payment.amount} for invoice: ##{key} failed error: <span class='color-red'> #{error_messages(payment)} </span> </li>"
          end
        end
      end
    end

    redirect_to new_pos_suppliers_payment_path(supplier_id: params['supplier_id']), notice: @response << '</ul>'
  end

  def print_voucher
    if params[:payment_id].present?
      @payments = @supplier.payments.where(id: params[:payment_id])
    else
      payment_date = params[:payment_date] || Date.today
      @payments = @supplier.payments.where('date(created_at) = ?', payment_date)
    end
  end

  private

  def set_supplier
    @supplier = Pos::Supplier.find(params[:id])
  end

  def supplier_params
    params.require(:pos_supplier).permit!
  end
end


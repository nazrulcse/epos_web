class Pos::Suppliers::PaymentsController < InheritedResources::Base
  before_action :set_payment, only: [:show, :edit, :update, :delete]

  def index
    @payments = current_department.suppliers_payments
  end

  def show

  end

  def new
    @payment = Pos::Suppliers::Payment.new
  end

  def create
    @payment = current_department.suppliers_payments.build(payment_params)

    if @payment.save
      flash[:notice] = 'Supplier payment saved successfully.'
    else
      flash[:error] = 'Supplier payment saving failed.'
    end

    redirect_to pos_suppliers_payments_path
  end

  def edit

  end

  def update
    if @payment.update(payment_params)
      flash[:notice] = 'Supplier payment info updated successfully.'
    else
      flash[:error] = 'Supplier payment info update failed.'
    end
    redirect_to pos_suppliers_payments_path
  end

  def delete
    if @payment.destroy
      flash[:notice] = 'Supplier payment deleted successfully.'
    else
      flash[:error] = 'Supplier payment deletion failed.'
    end
    redirect_to pos_suppliers_payments_path
  end

  private

  def set_payment
    @payment = Pos::Suppliers::Payment.find(params[:id])
  end

  def payment_params
    params.require(:pos_suppliers_payment).permit!
  end
end


class Pos::Customers::PaymentsController < InheritedResources::Base
  before_filter :current_ability
  before_action :set_payment, only: [:show, :edit, :update, :delete]

  def index
    @payments = current_department.customers_payments
  end

  def show

  end

  def new
    @payment = Pos::Customers::Payment.new
  end

  def create
    @payment = current_department.customers_payments.build(payment_params)

    if @payment.save
      flash[:notice] = 'Customer payment saved successfully.'
    else
      flash[:error] = 'Customer payment saving failed.'
    end

    redirect_to pos_customers_payments_path
  end

  def edit

  end

  def update
    if @payment.update(payment_params)
      flash[:notice] = 'Customer payment info updated successfully.'
    else
      flash[:error] = 'Customer payment info update failed.'
    end
    redirect_to pos_customers_payments_path
  end

  def delete
    if @payment.destroy
      flash[:notice] = 'Customer payment deleted successfully.'
    else
      flash[:error] = 'Customer payment deletion failed.'
    end
    redirect_to pos_customers_payments_path
  end

  private

  def set_payment
    @payment = Pos::Customers::Payment.find(params[:id])
  end

  def payment_params
    params.require(:pos_customers_payment).permit!
  end
end


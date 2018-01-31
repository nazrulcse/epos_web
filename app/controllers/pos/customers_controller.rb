class Pos::CustomersController < InheritedResources::Base

  before_action :set_customer, only: [:show, :edit, :update, :delete]

  def index
    @customers = current_department.customers
  end

  def show

  end

  def new
    @customer = Pos::Customer.new
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

  private

  def set_customer
    @customer = Pos::Customer.find(params[:id])
  end

  def customer_params
    params.require(:pos_customer).permit(:name, :company, :address, :city, :email, :mobile, :department_id, :initial_balance, :nid, :nid_image, :passport_no, :passport_image, :driving_licence, :driving_licence_image)
  end
end


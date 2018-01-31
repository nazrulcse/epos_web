class Pos::SuppliersController < InheritedResources::Base
  before_action :set_supplier, only: [:show, :edit, :update, :delete]

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

  private

  def set_supplier
    @supplier = Pos::Supplier.find(params[:id])
  end

  def supplier_params
    params.require(:pos_supplier).permit(:name, :company, :address, :city, :email, :mobile, :department_id)
  end
end


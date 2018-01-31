class Pos::Customers::InvoiceItemsController < InheritedResources::Base

  private

  def invoice_item_params
    params.require(:pos_customers_invoice_item).permit!
  end
end


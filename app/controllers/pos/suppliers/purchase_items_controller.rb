class Pos::Suppliers::PurchaseItemsController < InheritedResources::Base

  private

  def purchase_item_params
    params.require(:pos_suppliers_purchase_item).permit!
  end
end


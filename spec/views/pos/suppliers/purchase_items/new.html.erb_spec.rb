require 'rails_helper'

RSpec.describe "pos/suppliers/new", type: :view do
  before(:each) do
    assign(:pos_supplier, Pos::Suppliers::PurchaseItem.new(
      :old_cost_price => 1.5,
      :old_sale_price => 1.5,
      :old_whole_sale => 1.5,
      :issued_quantity => 1,
      :department => nil,
      :note => "MyText",
      :is_received => false,
      :received_quantity => 1,
      :cost_price => 1.5,
      :sale_price => 1.5,
      :whole_sale => 1.5,
      :amount => 1.5,
      :discount => 1.5,
      :vat => 1.5,
      :total => 1.5
    ))
  end

  it "renders new pos_supplier form" do
    render

    assert_select "form[action=?][method=?]", pos_suppliers_purchase_items_path, "post" do

      assert_select "input#pos_supplier_old_cost_price[name=?]", "pos_supplier[old_cost_price]"

      assert_select "input#pos_supplier_old_sale_price[name=?]", "pos_supplier[old_sale_price]"

      assert_select "input#pos_supplier_old_whole_sale[name=?]", "pos_supplier[old_whole_sale]"

      assert_select "input#pos_supplier_issued_quantity[name=?]", "pos_supplier[issued_quantity]"

      assert_select "input#pos_supplier_department_id[name=?]", "pos_supplier[department_id]"

      assert_select "textarea#pos_supplier_note[name=?]", "pos_supplier[note]"

      assert_select "input#pos_supplier_is_received[name=?]", "pos_supplier[is_received]"

      assert_select "input#pos_supplier_received_quantity[name=?]", "pos_supplier[received_quantity]"

      assert_select "input#pos_supplier_cost_price[name=?]", "pos_supplier[cost_price]"

      assert_select "input#pos_supplier_sale_price[name=?]", "pos_supplier[sale_price]"

      assert_select "input#pos_supplier_whole_sale[name=?]", "pos_supplier[whole_sale]"

      assert_select "input#pos_supplier_amount[name=?]", "pos_supplier[amount]"

      assert_select "input#pos_supplier_discount[name=?]", "pos_supplier[discount]"

      assert_select "input#pos_supplier_vat[name=?]", "pos_supplier[vat]"

      assert_select "input#pos_supplier_total[name=?]", "pos_supplier[total]"
    end
  end
end

require 'rails_helper'

RSpec.describe "pos/suppliers/new", type: :view do
  before(:each) do
    assign(:pos_supplier, Pos::Suppliers::Purchase.new(
      :code => "MyString",
      :department => nil,
      :instruction => "MyText",
      :is_received => false,
      :amount => 1.5,
      :discount => 1.5,
      :vat => 1.5,
      :total => 1.5,
      :note => "MyText",
      :attachment => "MyText"
    ))
  end

  it "renders new pos_supplier form" do
    render

    assert_select "form[action=?][method=?]", pos_suppliers_purchases_path, "post" do

      assert_select "input#pos_supplier_code[name=?]", "pos_supplier[code]"

      assert_select "input#pos_supplier_department_id[name=?]", "pos_supplier[department_id]"

      assert_select "textarea#pos_supplier_instruction[name=?]", "pos_supplier[instruction]"

      assert_select "input#pos_supplier_is_received[name=?]", "pos_supplier[is_received]"

      assert_select "input#pos_supplier_amount[name=?]", "pos_supplier[amount]"

      assert_select "input#pos_supplier_discount[name=?]", "pos_supplier[discount]"

      assert_select "input#pos_supplier_vat[name=?]", "pos_supplier[vat]"

      assert_select "input#pos_supplier_total[name=?]", "pos_supplier[total]"

      assert_select "textarea#pos_supplier_note[name=?]", "pos_supplier[note]"

      assert_select "textarea#pos_supplier_attachment[name=?]", "pos_supplier[attachment]"
    end
  end
end

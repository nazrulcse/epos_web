require 'rails_helper'

RSpec.describe "pos/suppliers/edit", type: :view do
  before(:each) do
    @pos_supplier = assign(:pos_supplier, Pos::Suppliers::Payment.create!(
      :department => nil,
      :employee => nil,
      :payment_method => "MyString",
      :note => "MyText",
      :amount => 1.5,
      :discount => 1.5,
      :total => 1.5,
      :transaction_token => "MyString",
      :attachment => "MyText"
    ))
  end

  it "renders the edit pos_supplier form" do
    render

    assert_select "form[action=?][method=?]", pos_supplier_path(@pos_supplier), "post" do

      assert_select "input#pos_supplier_department_id[name=?]", "pos_supplier[department_id]"

      assert_select "input#pos_supplier_employee_id[name=?]", "pos_supplier[employee_id]"

      assert_select "input#pos_supplier_payment_method[name=?]", "pos_supplier[payment_method]"

      assert_select "textarea#pos_supplier_note[name=?]", "pos_supplier[note]"

      assert_select "input#pos_supplier_amount[name=?]", "pos_supplier[amount]"

      assert_select "input#pos_supplier_discount[name=?]", "pos_supplier[discount]"

      assert_select "input#pos_supplier_total[name=?]", "pos_supplier[total]"

      assert_select "input#pos_supplier_transaction_token[name=?]", "pos_supplier[transaction_token]"

      assert_select "textarea#pos_supplier_attachment[name=?]", "pos_supplier[attachment]"
    end
  end
end

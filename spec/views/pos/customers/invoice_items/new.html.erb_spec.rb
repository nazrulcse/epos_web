require 'rails_helper'

RSpec.describe "pos/customers/new", type: :view do
  before(:each) do
    assign(:pos_customer, Pos::Customers::InvoiceItem.new(
      :department => nil,
      :note => "MyText",
      :cost_price => 1.5,
      :sale_price => 1.5,
      :whole_sale => 1.5,
      :quantity => 1,
      :amount => 1.5,
      :discount => 1.5,
      :vat => 1.5,
      :total => 1.5,
      :attchment => "MyText"
    ))
  end

  it "renders new pos_customer form" do
    render

    assert_select "form[action=?][method=?]", pos_customers_invoice_items_path, "post" do

      assert_select "input#pos_customer_department_id[name=?]", "pos_customer[department_id]"

      assert_select "textarea#pos_customer_note[name=?]", "pos_customer[note]"

      assert_select "input#pos_customer_cost_price[name=?]", "pos_customer[cost_price]"

      assert_select "input#pos_customer_sale_price[name=?]", "pos_customer[sale_price]"

      assert_select "input#pos_customer_whole_sale[name=?]", "pos_customer[whole_sale]"

      assert_select "input#pos_customer_quantity[name=?]", "pos_customer[quantity]"

      assert_select "input#pos_customer_amount[name=?]", "pos_customer[amount]"

      assert_select "input#pos_customer_discount[name=?]", "pos_customer[discount]"

      assert_select "input#pos_customer_vat[name=?]", "pos_customer[vat]"

      assert_select "input#pos_customer_total[name=?]", "pos_customer[total]"

      assert_select "textarea#pos_customer_attchment[name=?]", "pos_customer[attchment]"
    end
  end
end

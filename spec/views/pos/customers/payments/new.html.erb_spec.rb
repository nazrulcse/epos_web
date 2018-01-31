require 'rails_helper'

RSpec.describe "pos/customers/new", type: :view do
  before(:each) do
    assign(:pos_customer, Pos::Customers::Payment.new(
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

  it "renders new pos_customer form" do
    render

    assert_select "form[action=?][method=?]", pos_customers_payments_path, "post" do

      assert_select "input#pos_customer_department_id[name=?]", "pos_customer[department_id]"

      assert_select "input#pos_customer_employee_id[name=?]", "pos_customer[employee_id]"

      assert_select "input#pos_customer_payment_method[name=?]", "pos_customer[payment_method]"

      assert_select "textarea#pos_customer_note[name=?]", "pos_customer[note]"

      assert_select "input#pos_customer_amount[name=?]", "pos_customer[amount]"

      assert_select "input#pos_customer_discount[name=?]", "pos_customer[discount]"

      assert_select "input#pos_customer_total[name=?]", "pos_customer[total]"

      assert_select "input#pos_customer_transaction_token[name=?]", "pos_customer[transaction_token]"

      assert_select "textarea#pos_customer_attachment[name=?]", "pos_customer[attachment]"
    end
  end
end

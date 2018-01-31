require 'rails_helper'

RSpec.describe "pos/customers/edit", type: :view do
  before(:each) do
    @pos_customer = assign(:pos_customer, Pos::Customers::Invoice.create!(
      :number => "MyString",
      :department => nil,
      :employee => nil,
      :note => "MyText",
      :amount => 1.5,
      :discount => 1.5,
      :vat => 1.5,
      :total => 1.5,
      :attchment => "MyText"
    ))
  end

  it "renders the edit pos_customer form" do
    render

    assert_select "form[action=?][method=?]", pos_customer_path(@pos_customer), "post" do

      assert_select "input#pos_customer_number[name=?]", "pos_customer[number]"

      assert_select "input#pos_customer_department_id[name=?]", "pos_customer[department_id]"

      assert_select "input#pos_customer_employee_id[name=?]", "pos_customer[employee_id]"

      assert_select "textarea#pos_customer_note[name=?]", "pos_customer[note]"

      assert_select "input#pos_customer_amount[name=?]", "pos_customer[amount]"

      assert_select "input#pos_customer_discount[name=?]", "pos_customer[discount]"

      assert_select "input#pos_customer_vat[name=?]", "pos_customer[vat]"

      assert_select "input#pos_customer_total[name=?]", "pos_customer[total]"

      assert_select "textarea#pos_customer_attchment[name=?]", "pos_customer[attchment]"
    end
  end
end

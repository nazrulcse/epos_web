require 'rails_helper'

RSpec.describe "pos/customers/edit", type: :view do
  before(:each) do
    @pos_customer = assign(:pos_customer, Pos::Customer.create!(
      :name => "MyString",
      :company => "MyString",
      :address => "MyString",
      :city => "MyString",
      :email => "MyString",
      :mobile => "MyString",
      :department_id => 1,
      :initial_balance => 1.5,
      :nid => "MyString",
      :nid_image => "MyText",
      :passport_no => "MyString",
      :passport_image => "MyText",
      :driving_licence => "MyString",
      :driving_licence_image => "MyText"
    ))
  end

  it "renders the edit pos_customer form" do
    render

    assert_select "form[action=?][method=?]", pos_customer_path(@pos_customer), "post" do

      assert_select "input#pos_customer_name[name=?]", "pos_customer[name]"

      assert_select "input#pos_customer_company[name=?]", "pos_customer[company]"

      assert_select "input#pos_customer_address[name=?]", "pos_customer[address]"

      assert_select "input#pos_customer_city[name=?]", "pos_customer[city]"

      assert_select "input#pos_customer_email[name=?]", "pos_customer[email]"

      assert_select "input#pos_customer_mobile[name=?]", "pos_customer[mobile]"

      assert_select "input#pos_customer_department_id[name=?]", "pos_customer[department_id]"

      assert_select "input#pos_customer_initial_balance[name=?]", "pos_customer[initial_balance]"

      assert_select "input#pos_customer_nid[name=?]", "pos_customer[nid]"

      assert_select "textarea#pos_customer_nid_image[name=?]", "pos_customer[nid_image]"

      assert_select "input#pos_customer_passport_no[name=?]", "pos_customer[passport_no]"

      assert_select "textarea#pos_customer_passport_image[name=?]", "pos_customer[passport_image]"

      assert_select "input#pos_customer_driving_licence[name=?]", "pos_customer[driving_licence]"

      assert_select "textarea#pos_customer_driving_licence_image[name=?]", "pos_customer[driving_licence_image]"
    end
  end
end

require 'rails_helper'

RSpec.describe "pos/customers/new", type: :view do
  before(:each) do
    assign(:pos_customer, Pos::Customers::Category.new(
      :department => nil,
      :name => "MyString",
      :description => "MyText",
      :is_active => false
    ))
  end

  it "renders new pos_customer form" do
    render

    assert_select "form[action=?][method=?]", pos_customers_categories_path, "post" do

      assert_select "input#pos_customer_department_id[name=?]", "pos_customer[department_id]"

      assert_select "input#pos_customer_name[name=?]", "pos_customer[name]"

      assert_select "textarea#pos_customer_description[name=?]", "pos_customer[description]"

      assert_select "input#pos_customer_is_active[name=?]", "pos_customer[is_active]"
    end
  end
end

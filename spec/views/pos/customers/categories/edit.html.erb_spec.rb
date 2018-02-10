require 'rails_helper'

RSpec.describe "pos/customers/edit", type: :view do
  before(:each) do
    @pos_customer = assign(:pos_customer, Pos::Customers::Category.create!(
      :department => nil,
      :name => "MyString",
      :description => "MyText",
      :is_active => false
    ))
  end

  it "renders the edit pos_customer form" do
    render

    assert_select "form[action=?][method=?]", pos_customer_path(@pos_customer), "post" do

      assert_select "input#pos_customer_department_id[name=?]", "pos_customer[department_id]"

      assert_select "input#pos_customer_name[name=?]", "pos_customer[name]"

      assert_select "textarea#pos_customer_description[name=?]", "pos_customer[description]"

      assert_select "input#pos_customer_is_active[name=?]", "pos_customer[is_active]"
    end
  end
end

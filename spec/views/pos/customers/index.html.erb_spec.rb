require 'rails_helper'

RSpec.describe "pos/customers/index", type: :view do
  before(:each) do
    assign(:pos_customers, [
      Pos::Customer.create!(
        :name => "Name",
        :company => "Company",
        :address => "Address",
        :city => "City",
        :email => "Email",
        :mobile => "Mobile",
        :department_id => 2,
        :initial_balance => 3.5,
        :nid => "Nid",
        :nid_image => "MyText",
        :passport_no => "Passport No",
        :passport_image => "MyText",
        :driving_licence => "Driving Licence",
        :driving_licence_image => "MyText"
      ),
      Pos::Customer.create!(
        :name => "Name",
        :company => "Company",
        :address => "Address",
        :city => "City",
        :email => "Email",
        :mobile => "Mobile",
        :department_id => 2,
        :initial_balance => 3.5,
        :nid => "Nid",
        :nid_image => "MyText",
        :passport_no => "Passport No",
        :passport_image => "MyText",
        :driving_licence => "Driving Licence",
        :driving_licence_image => "MyText"
      )
    ])
  end

  it "renders a list of pos/customers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Company".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => "Nid".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Passport No".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Driving Licence".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

require 'rails_helper'

RSpec.describe "pos/suppliers/index", type: :view do
  before(:each) do
    assign(:pos_suppliers, [
      Pos::Supplier.create!(
        :name => "Name",
        :company => "Company",
        :address => "Address",
        :city => "City",
        :email => "Email",
        :mobile => "Mobile",
        :department_id => 2
      ),
      Pos::Supplier.create!(
        :name => "Name",
        :company => "Company",
        :address => "Address",
        :city => "City",
        :email => "Email",
        :mobile => "Mobile",
        :department_id => 2
      )
    ])
  end

  it "renders a list of pos/suppliers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Company".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end

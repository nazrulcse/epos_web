require 'rails_helper'

RSpec.describe "pos/customers/index", type: :view do
  before(:each) do
    assign(:pos_customers_invoices, [
      Pos::Customers::Invoice.create!(
        :number => "Number",
        :department => nil,
        :employee => nil,
        :note => "MyText",
        :amount => 2.5,
        :discount => 3.5,
        :vat => 4.5,
        :total => 5.5,
        :attchment => "MyText"
      ),
      Pos::Customers::Invoice.create!(
        :number => "Number",
        :department => nil,
        :employee => nil,
        :note => "MyText",
        :amount => 2.5,
        :discount => 3.5,
        :vat => 4.5,
        :total => 5.5,
        :attchment => "MyText"
      )
    ])
  end

  it "renders a list of pos/customers" do
    render
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
    assert_select "tr>td", :text => 5.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

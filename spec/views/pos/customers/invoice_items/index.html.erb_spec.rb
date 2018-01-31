require 'rails_helper'

RSpec.describe "pos/customers/index", type: :view do
  before(:each) do
    assign(:pos_customers_invoice_items, [
      Pos::Customers::InvoiceItem.create!(
        :department => nil,
        :note => "MyText",
        :cost_price => 2.5,
        :sale_price => 3.5,
        :whole_sale => 4.5,
        :quantity => 5,
        :amount => 6.5,
        :discount => 7.5,
        :vat => 8.5,
        :total => 9.5,
        :attchment => "MyText"
      ),
      Pos::Customers::InvoiceItem.create!(
        :department => nil,
        :note => "MyText",
        :cost_price => 2.5,
        :sale_price => 3.5,
        :whole_sale => 4.5,
        :quantity => 5,
        :amount => 6.5,
        :discount => 7.5,
        :vat => 8.5,
        :total => 9.5,
        :attchment => "MyText"
      )
    ])
  end

  it "renders a list of pos/customers" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.5.to_s, :count => 2
    assert_select "tr>td", :text => 7.5.to_s, :count => 2
    assert_select "tr>td", :text => 8.5.to_s, :count => 2
    assert_select "tr>td", :text => 9.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

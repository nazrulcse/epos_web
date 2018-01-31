require 'rails_helper'

RSpec.describe "pos/suppliers/index", type: :view do
  before(:each) do
    assign(:pos_suppliers_purchase_items, [
      Pos::Suppliers::PurchaseItem.create!(
        :old_cost_price => 2.5,
        :old_sale_price => 3.5,
        :old_whole_sale => 4.5,
        :issued_quantity => 5,
        :department => nil,
        :note => "MyText",
        :is_received => false,
        :received_quantity => 6,
        :cost_price => 7.5,
        :sale_price => 8.5,
        :whole_sale => 9.5,
        :amount => 10.5,
        :discount => 11.5,
        :vat => 12.5,
        :total => 13.5
      ),
      Pos::Suppliers::PurchaseItem.create!(
        :old_cost_price => 2.5,
        :old_sale_price => 3.5,
        :old_whole_sale => 4.5,
        :issued_quantity => 5,
        :department => nil,
        :note => "MyText",
        :is_received => false,
        :received_quantity => 6,
        :cost_price => 7.5,
        :sale_price => 8.5,
        :whole_sale => 9.5,
        :amount => 10.5,
        :discount => 11.5,
        :vat => 12.5,
        :total => 13.5
      )
    ])
  end

  it "renders a list of pos/suppliers" do
    render
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.5.to_s, :count => 2
    assert_select "tr>td", :text => 8.5.to_s, :count => 2
    assert_select "tr>td", :text => 9.5.to_s, :count => 2
    assert_select "tr>td", :text => 10.5.to_s, :count => 2
    assert_select "tr>td", :text => 11.5.to_s, :count => 2
    assert_select "tr>td", :text => 12.5.to_s, :count => 2
    assert_select "tr>td", :text => 13.5.to_s, :count => 2
  end
end

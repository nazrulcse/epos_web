require 'rails_helper'

RSpec.describe "pos/products/index", type: :view do
  before(:each) do
    assign(:pos_products, [
      Pos::Product.create!(
        :code => "Code",
        :barcode => "Barcode",
        :name => "Name",
        :description => "MyText",
        :department => nil,
        :re_order_level => 2,
        :cost_price => 3.5,
        :sale_price => 4.5,
        :whole_sale => 5.5,
        :expirable => false,
        :discountable => false,
        :stock => 6,
        :is_active => false
      ),
      Pos::Product.create!(
        :code => "Code",
        :barcode => "Barcode",
        :name => "Name",
        :description => "MyText",
        :department => nil,
        :re_order_level => 2,
        :cost_price => 3.5,
        :sale_price => 4.5,
        :whole_sale => 5.5,
        :expirable => false,
        :discountable => false,
        :stock => 6,
        :is_active => false
      )
    ])
  end

  it "renders a list of pos/products" do
    render
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Barcode".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
    assert_select "tr>td", :text => 5.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

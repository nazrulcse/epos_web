require 'rails_helper'

RSpec.describe "pos/suppliers/index", type: :view do
  before(:each) do
    assign(:pos_suppliers_purchases, [
      Pos::Suppliers::Purchase.create!(
        :code => "Code",
        :department => nil,
        :instruction => "MyText",
        :is_received => false,
        :amount => 2.5,
        :discount => 3.5,
        :vat => 4.5,
        :total => 5.5,
        :note => "MyText",
        :attachment => "MyText"
      ),
      Pos::Suppliers::Purchase.create!(
        :code => "Code",
        :department => nil,
        :instruction => "MyText",
        :is_received => false,
        :amount => 2.5,
        :discount => 3.5,
        :vat => 4.5,
        :total => 5.5,
        :note => "MyText",
        :attachment => "MyText"
      )
    ])
  end

  it "renders a list of pos/suppliers" do
    render
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
    assert_select "tr>td", :text => 5.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

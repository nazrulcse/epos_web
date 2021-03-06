require 'rails_helper'

RSpec.describe "pos/products/index", type: :view do
  before(:each) do
    assign(:pos_products_sub_categories, [
      Pos::Products::SubCategory.create!(
        :code => "Code",
        :department => nil,
        :name => "Name",
        :description => "MyText",
        :is_active => false
      ),
      Pos::Products::SubCategory.create!(
        :code => "Code",
        :department => nil,
        :name => "Name",
        :description => "MyText",
        :is_active => false
      )
    ])
  end

  it "renders a list of pos/products" do
    render
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

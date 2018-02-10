require 'rails_helper'

RSpec.describe "pos/customers/index", type: :view do
  before(:each) do
    assign(:pos_customers_categories, [
      Pos::Customers::Category.create!(
        :department => nil,
        :name => "Name",
        :description => "MyText",
        :is_active => false
      ),
      Pos::Customers::Category.create!(
        :department => nil,
        :name => "Name",
        :description => "MyText",
        :is_active => false
      )
    ])
  end

  it "renders a list of pos/customers" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

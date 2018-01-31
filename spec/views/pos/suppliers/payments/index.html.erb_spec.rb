require 'rails_helper'

RSpec.describe "pos/suppliers/index", type: :view do
  before(:each) do
    assign(:pos_suppliers_payments, [
      Pos::Suppliers::Payment.create!(
        :department => nil,
        :employee => nil,
        :payment_method => "Payment Method",
        :note => "MyText",
        :amount => 2.5,
        :discount => 3.5,
        :total => 4.5,
        :transaction_token => "Transaction Token",
        :attachment => "MyText"
      ),
      Pos::Suppliers::Payment.create!(
        :department => nil,
        :employee => nil,
        :payment_method => "Payment Method",
        :note => "MyText",
        :amount => 2.5,
        :discount => 3.5,
        :total => 4.5,
        :transaction_token => "Transaction Token",
        :attachment => "MyText"
      )
    ])
  end

  it "renders a list of pos/suppliers" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Payment Method".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
    assert_select "tr>td", :text => "Transaction Token".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

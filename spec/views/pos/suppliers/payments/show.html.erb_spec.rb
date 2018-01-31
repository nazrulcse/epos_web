require 'rails_helper'

RSpec.describe "pos/suppliers/show", type: :view do
  before(:each) do
    @pos_supplier = assign(:pos_supplier, Pos::Suppliers::Payment.create!(
      :department => nil,
      :employee => nil,
      :payment_method => "Payment Method",
      :note => "MyText",
      :amount => 2.5,
      :discount => 3.5,
      :total => 4.5,
      :transaction_token => "Transaction Token",
      :attachment => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Payment Method/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(/Transaction Token/)
    expect(rendered).to match(/MyText/)
  end
end

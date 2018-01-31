require 'rails_helper'

RSpec.describe "pos/customers/show", type: :view do
  before(:each) do
    @pos_customer = assign(:pos_customer, Pos::Customers::InvoiceItem.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6.5/)
    expect(rendered).to match(/7.5/)
    expect(rendered).to match(/8.5/)
    expect(rendered).to match(/9.5/)
    expect(rendered).to match(/MyText/)
  end
end

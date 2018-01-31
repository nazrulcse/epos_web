require 'rails_helper'

RSpec.describe "pos/customers/show", type: :view do
  before(:each) do
    @pos_customer = assign(:pos_customer, Pos::Customers::Invoice.create!(
      :number => "Number",
      :department => nil,
      :employee => nil,
      :note => "MyText",
      :amount => 2.5,
      :discount => 3.5,
      :vat => 4.5,
      :total => 5.5,
      :attchment => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Number/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(/5.5/)
    expect(rendered).to match(/MyText/)
  end
end

require 'rails_helper'

RSpec.describe "pos/products/show", type: :view do
  before(:each) do
    @pos_product = assign(:pos_product, Pos::Product.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/Barcode/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(/5.5/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/false/)
  end
end

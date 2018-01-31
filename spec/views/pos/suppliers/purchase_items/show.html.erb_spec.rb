require 'rails_helper'

RSpec.describe "pos/suppliers/show", type: :view do
  before(:each) do
    @pos_supplier = assign(:pos_supplier, Pos::Suppliers::PurchaseItem.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7.5/)
    expect(rendered).to match(/8.5/)
    expect(rendered).to match(/9.5/)
    expect(rendered).to match(/10.5/)
    expect(rendered).to match(/11.5/)
    expect(rendered).to match(/12.5/)
    expect(rendered).to match(/13.5/)
  end
end

require 'rails_helper'

RSpec.describe "pos/suppliers/show", type: :view do
  before(:each) do
    @pos_supplier = assign(:pos_supplier, Pos::Suppliers::Purchase.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Code/)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(/5.5/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end

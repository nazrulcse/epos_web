require 'rails_helper'

RSpec.describe "pos/products/show", type: :view do
  before(:each) do
    @pos_product = assign(:pos_product, Pos::Products::Brand.create!(
      :code => "Code",
      :department => nil,
      :name => "Name",
      :description => "MyText",
      :is_active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Code/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end

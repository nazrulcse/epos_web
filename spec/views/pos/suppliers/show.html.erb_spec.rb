require 'rails_helper'

RSpec.describe "pos/suppliers/show", type: :view do
  before(:each) do
    @pos_supplier = assign(:pos_supplier, Pos::Supplier.create!(
      :name => "Name",
      :company => "Company",
      :address => "Address",
      :city => "City",
      :email => "Email",
      :mobile => "Mobile",
      :department_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Company/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Mobile/)
    expect(rendered).to match(/2/)
  end
end

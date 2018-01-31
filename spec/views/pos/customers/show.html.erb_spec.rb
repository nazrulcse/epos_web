require 'rails_helper'

RSpec.describe "pos/customers/show", type: :view do
  before(:each) do
    @pos_customer = assign(:pos_customer, Pos::Customer.create!(
      :name => "Name",
      :company => "Company",
      :address => "Address",
      :city => "City",
      :email => "Email",
      :mobile => "Mobile",
      :department_id => 2,
      :initial_balance => 3.5,
      :nid => "Nid",
      :nid_image => "MyText",
      :passport_no => "Passport No",
      :passport_image => "MyText",
      :driving_licence => "Driving Licence",
      :driving_licence_image => "MyText"
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
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/Nid/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Passport No/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Driving Licence/)
    expect(rendered).to match(/MyText/)
  end
end

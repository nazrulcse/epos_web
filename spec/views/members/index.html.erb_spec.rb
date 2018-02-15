require 'rails_helper'

RSpec.describe "members/index", type: :view do
  before(:each) do
    assign(:members, [
      Member.create!(
        :company => nil,
        :name => "Name",
        :email => "Email",
        :mobile => "Mobile",
        :address => "Address",
        :point => "",
        :last_point => "",
        :is_active => false
      ),
      Member.create!(
        :company => nil,
        :name => "Name",
        :email => "Email",
        :mobile => "Mobile",
        :address => "Address",
        :point => "",
        :last_point => "",
        :is_active => false
      )
    ])
  end

  it "renders a list of members" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

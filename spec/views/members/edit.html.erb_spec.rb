require 'rails_helper'

RSpec.describe "members/edit", type: :view do
  before(:each) do
    @member = assign(:member, Member.create!(
      :company => nil,
      :name => "MyString",
      :email => "MyString",
      :mobile => "MyString",
      :address => "MyString",
      :point => "",
      :last_point => "",
      :is_active => false
    ))
  end

  it "renders the edit member form" do
    render

    assert_select "form[action=?][method=?]", member_path(@member), "post" do

      assert_select "input#member_company_id[name=?]", "member[company_id]"

      assert_select "input#member_name[name=?]", "member[name]"

      assert_select "input#member_email[name=?]", "member[email]"

      assert_select "input#member_mobile[name=?]", "member[mobile]"

      assert_select "input#member_address[name=?]", "member[address]"

      assert_select "input#member_point[name=?]", "member[point]"

      assert_select "input#member_last_point[name=?]", "member[last_point]"

      assert_select "input#member_is_active[name=?]", "member[is_active]"
    end
  end
end

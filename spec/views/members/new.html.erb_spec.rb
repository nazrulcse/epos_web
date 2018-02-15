require 'rails_helper'

RSpec.describe "members/new", type: :view do
  before(:each) do
    assign(:member, Member.new(
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

  it "renders new member form" do
    render

    assert_select "form[action=?][method=?]", members_path, "post" do

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

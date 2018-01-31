require 'rails_helper'

RSpec.describe "pos/suppliers/edit", type: :view do
  before(:each) do
    @pos_supplier = assign(:pos_supplier, Pos::Supplier.create!(
      :name => "MyString",
      :company => "MyString",
      :address => "MyString",
      :city => "MyString",
      :email => "MyString",
      :mobile => "MyString",
      :department_id => 1
    ))
  end

  it "renders the edit pos_supplier form" do
    render

    assert_select "form[action=?][method=?]", pos_supplier_path(@pos_supplier), "post" do

      assert_select "input#pos_supplier_name[name=?]", "pos_supplier[name]"

      assert_select "input#pos_supplier_company[name=?]", "pos_supplier[company]"

      assert_select "input#pos_supplier_address[name=?]", "pos_supplier[address]"

      assert_select "input#pos_supplier_city[name=?]", "pos_supplier[city]"

      assert_select "input#pos_supplier_email[name=?]", "pos_supplier[email]"

      assert_select "input#pos_supplier_mobile[name=?]", "pos_supplier[mobile]"

      assert_select "input#pos_supplier_department_id[name=?]", "pos_supplier[department_id]"
    end
  end
end

require 'rails_helper'

RSpec.describe "pos/products/edit", type: :view do
  before(:each) do
    @pos_product = assign(:pos_product, Pos::Products::SubCategory.create!(
      :code => "MyString",
      :department => nil,
      :name => "MyString",
      :description => "MyText",
      :is_active => false
    ))
  end

  it "renders the edit pos_product form" do
    render

    assert_select "form[action=?][method=?]", pos_product_path(@pos_product), "post" do

      assert_select "input#pos_product_code[name=?]", "pos_product[code]"

      assert_select "input#pos_product_department_id[name=?]", "pos_product[department_id]"

      assert_select "input#pos_product_name[name=?]", "pos_product[name]"

      assert_select "textarea#pos_product_description[name=?]", "pos_product[description]"

      assert_select "input#pos_product_is_active[name=?]", "pos_product[is_active]"
    end
  end
end

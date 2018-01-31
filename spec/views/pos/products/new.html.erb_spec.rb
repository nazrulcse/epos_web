require 'rails_helper'

RSpec.describe "pos/products/new", type: :view do
  before(:each) do
    assign(:pos_product, Pos::Product.new(
      :code => "MyString",
      :barcode => "MyString",
      :name => "MyString",
      :description => "MyText",
      :department => nil,
      :re_order_level => 1,
      :cost_price => 1.5,
      :sale_price => 1.5,
      :whole_sale => 1.5,
      :expirable => false,
      :discountable => false,
      :stock => 1,
      :is_active => false
    ))
  end

  it "renders new pos_product form" do
    render

    assert_select "form[action=?][method=?]", pos_products_path, "post" do

      assert_select "input#pos_product_code[name=?]", "pos_product[code]"

      assert_select "input#pos_product_barcode[name=?]", "pos_product[barcode]"

      assert_select "input#pos_product_name[name=?]", "pos_product[name]"

      assert_select "textarea#pos_product_description[name=?]", "pos_product[description]"

      assert_select "input#pos_product_department_id[name=?]", "pos_product[department_id]"

      assert_select "input#pos_product_re_order_level[name=?]", "pos_product[re_order_level]"

      assert_select "input#pos_product_cost_price[name=?]", "pos_product[cost_price]"

      assert_select "input#pos_product_sale_price[name=?]", "pos_product[sale_price]"

      assert_select "input#pos_product_whole_sale[name=?]", "pos_product[whole_sale]"

      assert_select "input#pos_product_expirable[name=?]", "pos_product[expirable]"

      assert_select "input#pos_product_discountable[name=?]", "pos_product[discountable]"

      assert_select "input#pos_product_stock[name=?]", "pos_product[stock]"

      assert_select "input#pos_product_is_active[name=?]", "pos_product[is_active]"
    end
  end
end

FactoryGirl.define do
  factory :pos_product, class: 'Pos::Product' do
    code "MyString"
    barcode "MyString"
    name "MyString"
    description "MyText"
    department nil
    re_order_level 1
    cost_price 1.5
    sale_price 1.5
    whole_sale 1.5
    expirable false
    discountable false
    stock 1
    is_active false
  end
end

FactoryGirl.define do
  factory :pos_products_brand, class: 'Pos::Products::Brand' do
    code "MyString"
    department nil
    name "MyString"
    description "MyText"
    is_active false
  end
end

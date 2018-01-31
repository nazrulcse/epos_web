FactoryGirl.define do
  factory :pos_products_sub_category, class: 'Pos::Products::SubCategory' do
    code "MyString"
    department nil
    name "MyString"
    description "MyText"
    is_active false
  end
end

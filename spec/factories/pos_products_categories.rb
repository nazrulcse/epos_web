FactoryGirl.define do
  factory :pos_products_category, class: 'Pos::Products::Category' do
    code "MyString"
    department nil
    name "MyString"
    description "MyText"
    is_active false
  end
end

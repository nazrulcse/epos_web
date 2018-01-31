FactoryGirl.define do
  factory :pos_products_model, class: 'Pos::Products::Model' do
    code "MyString"
    department nil
    name "MyString"
    description "MyText"
    is_active false
  end
end

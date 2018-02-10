FactoryGirl.define do
  factory :pos_customers_category, class: 'Pos::Customers::Category' do
    department nil
    name "MyString"
    description "MyText"
    is_active false
  end
end

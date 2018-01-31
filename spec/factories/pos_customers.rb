FactoryGirl.define do
  factory :pos_customer, class: 'Pos::Customer' do
    name "MyString"
    company "MyString"
    address "MyString"
    city "MyString"
    email "MyString"
    mobile "MyString"
    department_id 1
    initial_balance 1.5
    nid "MyString"
    nid_image "MyText"
    passport_no "MyString"
    passport_image "MyText"
    driving_licence "MyString"
    driving_licence_image "MyText"
  end
end

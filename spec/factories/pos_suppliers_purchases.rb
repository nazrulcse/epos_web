FactoryGirl.define do
  factory :pos_suppliers_purchase, class: 'Pos::Suppliers::Purchase' do
    code "MyString"
    issue_date "2018-01-26"
    expected_delivery "2018-01-26"
    department nil
    instruction "MyText"
    is_received false
    receive_date "2018-01-26"
    amount 1.5
    discount 1.5
    vat 1.5
    total 1.5
    note "MyText"
    attachment "MyText"
  end
end

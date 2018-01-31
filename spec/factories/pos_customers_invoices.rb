FactoryGirl.define do
  factory :pos_customers_invoice, class: 'Pos::Customers::Invoice' do
    number "MyString"
    date "2018-01-27"
    department nil
    employee nil
    note "MyText"
    amount 1.5
    discount 1.5
    vat 1.5
    total 1.5
    attchment "MyText"
  end
end

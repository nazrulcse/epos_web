FactoryGirl.define do
  factory :pos_customers_payment, class: 'Pos::Customers::Payment' do
    department nil
    employee nil
    date "2018-01-27"
    payment_method "MyString"
    note "MyText"
    amount 1.5
    discount 1.5
    total 1.5
    transaction_token "MyString"
    attachment "MyText"
  end
end

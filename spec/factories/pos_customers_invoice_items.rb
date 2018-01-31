FactoryGirl.define do
  factory :pos_customers_invoice_item, class: 'Pos::Customers::InvoiceItem' do
    department nil
    note "MyText"
    cost_price 1.5
    sale_price 1.5
    whole_sale 1.5
    quantity 1
    amount 1.5
    discount 1.5
    vat 1.5
    total 1.5
    attchment "MyText"
  end
end

FactoryGirl.define do
  factory :pos_suppliers_purchase_item, class: 'Pos::Suppliers::PurchaseItem' do
    old_cost_price 1.5
    old_sale_price 1.5
    old_whole_sale 1.5
    issued_quantity 1
    department nil
    note "MyText"
    is_received false
    received_quantity 1
    cost_price 1.5
    sale_price 1.5
    whole_sale 1.5
    amount 1.5
    discount 1.5
    vat 1.5
    total 1.5
  end
end

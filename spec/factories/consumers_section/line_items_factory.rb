FactoryGirl.define do
  factory :line_item, class: "ConsumersSection::LineItem" do
    cart nil
    order
    quantity "9.99"
    unit_cost "9.99"
    pricing_type 1
    stock
  end
end

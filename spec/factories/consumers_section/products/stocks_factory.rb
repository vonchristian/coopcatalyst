FactoryGirl.define do
  factory :stock, class: "ConsumersSection::Products::Stock" do
    product nil
    quantity "9.99"
    date_purchased "2017-02-01 09:32:55"
    purchase_cost "9.99"
    reference_number "MyString"
    expiry_date "2017-02-01 09:32:55"
    retail_price "9.99"
    wholesale_price "9.99"
    payment_type 1
    discounted false
    has_freight false
  end
end

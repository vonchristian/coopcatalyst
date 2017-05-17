FactoryGirl.define do
  factory :discount do
    discountable_id 1
    discountable_type "MyString"
    discount_type 1
    amount "9.99"
    percent "9.99"
  end
end

FactoryGirl.define do
  factory :refund do
    refundable_id 1
    refundable_type "MyString"
    amount "9.99"
    refund_type 1
    percent "9.99"
  end
end

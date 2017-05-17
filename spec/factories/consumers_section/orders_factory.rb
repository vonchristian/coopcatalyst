FactoryGirl.define do
  factory :order, class: "ConsumersSection::Order" do
    pay_type 1
    order_date "2017-02-01 10:02:46"
    reference_number "MyString"
    member nil
  end
end

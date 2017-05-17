FactoryGirl.define do
  factory :freight do
    type ""
    freightable_id 1
    freightable_type "MyString"
    amount "9.99"

    factory :freight_in do
      type "Freights::FreightIn"
    end
    factory :freight_out do
      type "Freights::FreightOut"
    end
  end
end

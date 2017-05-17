FactoryGirl.define do
  factory :time_deposit_product, class: "CoopServices::TimeDepositProduct" do
    name "MyString"
    interest_rate "MyString"
    starting "9.99"
    ending "9.99"
  end
end

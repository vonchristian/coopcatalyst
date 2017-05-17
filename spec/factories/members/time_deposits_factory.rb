FactoryGirl.define do
  factory :time_deposit, class: "Members::TimeDeposit" do
    member
    time_deposit_product
    amount "9.99"
    date_deposited "2017-01-26 20:33:43"
  end
end

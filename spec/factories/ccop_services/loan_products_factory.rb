FactoryGirl.define do
  factory :loan_product, class: "CoopServices::LoanProduct" do
    name "MyString"
    interest_rate "9.99"
    status 1
  end
end

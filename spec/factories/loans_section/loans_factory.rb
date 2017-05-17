FactoryGirl.define do
  factory :loan, class: "LoansSection::Loan" do
    member nil
    loan_product nil
    amount "9.99"
    application_date "2017-01-24 21:12:14"
    status 1
  end
end

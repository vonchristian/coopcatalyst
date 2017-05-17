FactoryGirl.define do
  factory :disbursement do
    disbursementable_id 1
    disbursementable_type "LoansSection::Loan"
    date "2017-02-02 20:12:13"
    user nil
  end
end

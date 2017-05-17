FactoryGirl.define do
  factory :loan_approval, class: "Loans::LoanApproval" do
    approve_date ""
    approver_id 1
  end
end

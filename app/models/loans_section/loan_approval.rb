module LoansSection
  class LoanApproval < Approval
      belongs_to :loan_approver, class_name: "LoansSection::LoanApprover", foreign_key: 'approver_id'
  end
end

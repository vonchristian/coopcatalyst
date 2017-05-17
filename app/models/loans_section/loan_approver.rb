module LoansSection
  class LoanApprover < Approver
    has_many :loan_approvals, class_name: "LoansSection::LoanApproval", foreign_key: "approver_id"
    has_many :approved_loans, through: :loan_approvals, source: :approvable, source_type: "LoansSection::Loan"

    delegate :full_name, :role, :avatar, to: :user

    def self.approved?(loan)
      result = all.map do |approver|
        approver.approved?(loan)
      end
      if result.include?(false)
        false
      else
        true
      end
    end

    def approved?(loan)
      approved_loans.include?(loan)
    end
  end
end

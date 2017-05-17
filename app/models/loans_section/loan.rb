module LoansSection
  class Loan < ApplicationRecord
    has_one :disbursement, as: :disbursementable
    has_many :loan_approvals, as: :approvable, class_name: "LoansSection::LoanApproval"
    has_many :loan_approvers, through: :loan_approvals
    belongs_to :member
    belongs_to :branch, class_name: "Coop::Branch"
    belongs_to :loan_product, class_name: "CoopServices::LoanProduct"
    has_many :payments, as: :commercial_document, class_name: "Accounting::Entry"
    validates :amount, presence: true, numericality: true

    delegate :name, to: :loan_product, prefix: true, allow_nil: true
    delegate :full_name, to: :member, prefix: true, allow_nil: true
    def payments
      Accounting::Account.find_by_name("Loans Receivable - Current").credit_entries.where(commercial_document: self).distinct
    end
    def balance
      amount - payments.total
    end
    def approved?
      LoansSection::LoanApprover.approved?(self)
    end

    def disbursed?
      disbursement.present?
    end
    def status
      if approved?
        "Approved"
      else
        "Processing"
      end
    end
    #move to decorator
    def status_label_color
      if approved?
        "success"
      else
        "warning"
      end
    end
  end
end

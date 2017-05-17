class Disbursement < ApplicationRecord
  has_one :entry, as: :commercial_document, class_name: "Accounting::Entry"
  belongs_to :disbursementable, polymorphic: true
  belongs_to :user

  after_commit :create_entry

  delegate :amount, to: :disbursementable, allow_nil: true

  private
  def create_entry
    Accounting::Entry.create(recorder: self.user, reference_number: self.reference_number,
    entry_date: self.date, commercial_document: self,
    description: "Loan disbursement on #{self.date.strftime("%B %e, %Y")}",
    credit_amounts_attributes: [amount: self.amount, account: "Cash on Hand"],
    debit_amounts_attributes: [amount: self.amount, account: "Loans Receivable - Current"])
  end
end

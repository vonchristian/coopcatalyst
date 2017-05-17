module Members
  class TimeDeposit < ApplicationRecord
    belongs_to :member
    belongs_to :branch, class_name: "Coop::Branch"
    belongs_to :time_deposit_product, class_name: "CoopServices::TimeDepositProduct"


    has_many :deposits, as: :commercial_document, class_name: "Accounting::Entry"

    validates :account_number, presence: true, uniqueness: true
    validates :time_deposit_product_id, presence: true, uniqueness: { scope: :member }

    delegate :name, to: :time_deposit_product, prefix: true, allow_nil: true

    def balance
      deposits.map{|a| a.debit_amounts.pluck(:amount).sum}.sum
    end
  end
end

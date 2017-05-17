module Members
  class Saving < ApplicationRecord
    belongs_to :member
    belongs_to :branch, class_name: "Coop::Branch"
    belongs_to :savings_product, class_name: "CoopServices::SavingsProduct"

    validates :date_opened, presence: true
    validates :account_number, presence: true, uniqueness: true
    validates :savings_product_id, uniqueness: { scope: :member_id }

    delegate :name, to: :savings_product, prefix: true
    def balance
      deposits - withdrawals
    end
    def deposits
      Accounting::Account.find_by_name("Savings Deposits").credit_entries.where(:commercial_document => self).distinct.map{|a| a.credit_amounts.pluck(:amount).sum}.sum
    end
    def withdrawals
      Accounting::Account.find_by_name("Savings Deposits").debit_entries.where(:commercial_document => self).distinct.map{|a| a.debit_amounts.pluck(:amount).sum}.sum
    end
  end
end

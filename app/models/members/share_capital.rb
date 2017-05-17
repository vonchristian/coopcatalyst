module Members
  class ShareCapital < ApplicationRecord
    belongs_to :member
    belongs_to :branch, class_name: "Coop::Branch"
    validates :account_number, presence: true, uniqueness: true

    def balance
      capital_build_ups
    end
    def capital_build_ups
      Accounting::Account.find_by_name("Paid-up Share Capital - Common").credit_entries.where(:commercial_document => self).distinct.map{|a| a.credit_amounts.pluck(:amount).sum}.sum
    end
  end
end

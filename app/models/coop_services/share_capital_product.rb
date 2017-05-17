module CoopServices
  class ShareCapitalProduct < ApplicationRecord
    validates :minimum_paid_up_share_capital, presence: true, numericality: true
  end
end

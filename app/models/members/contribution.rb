module Members
  class Contribution < ApplicationRecord
    belongs_to :contributor, class_name: "Member", foreign_key: "member_id"
    belongs_to :subscription, class_name: "Members::Susbscription"
    belongs_to :entry, class_name: "Accounting::Entry"
  end
end

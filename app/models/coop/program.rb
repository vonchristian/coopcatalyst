module Coop
  class Program < ApplicationRecord
    has_many :contributions, class_name: "Members::Contribution"
    has_many :contributors, through: :contributions, class_name: "Member"

    validates :name, presence: true, uniqueness: true
    validates :contribution_amount, presence: true, numericality: { greater_than: 0.1 }
    after_create :subscribe_members
    def self.default
      all.where(default: true)
    end

    private
    def subscribe_members
      if self.default?
        Member.all.each do |member|
          member.subscriptions.create(program: self)
        end
      end
    end
  end
end

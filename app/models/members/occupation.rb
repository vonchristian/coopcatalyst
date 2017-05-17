module Members
  class Occupation < ApplicationRecord
    belongs_to :member
    validates :title, presence: true

    def self.current(member)
      all.where(current: true, member: member).last
    end
  end
end

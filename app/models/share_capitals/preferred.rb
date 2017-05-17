module ShareCapitals
  class Preferred < Members::ShareCapital
    def self.for(member)
      all.where(member: member)
    end
  end
end

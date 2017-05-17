module ShareCapitals
  class Common < Members::ShareCapital
    def self.for(member)
      all.where(member: member)
    end
  end
end

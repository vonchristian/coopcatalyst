class Freight < ApplicationRecord
  # self.abstract_class = true
  belongs_to :freightable, polymorphic: true

  def self.total(freightable)
    if freightable.has_freight?
      all.sum(:amount)
    else
      0
    end
  end
end

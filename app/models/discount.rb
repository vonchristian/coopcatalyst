class Discount < ApplicationRecord
  belongs_to :discountable, polymorphic: true
  enum discount_type: [:amount, :percent]
  delegate :discountable_amount, to: :discountable

  def self.total(discountable)
    if discountable.discounted?
      discount_for(discountable)
    else
      0
    end
  end

  private
  def self.discount_for(discountable)
    if discountable.discount_amount?
      discountable.discount_amount
    elsif discountable.discount_percent?
      discountable.discountable_amount * discountable.discount_percent
    end
  end
end

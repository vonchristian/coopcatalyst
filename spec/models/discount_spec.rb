require 'rails_helper'

describe Discount do
  describe "associations" do
    it { is_expected.to belong_to :discountable }
  end

  describe "delegations" do
    it { is_expected.to delegate_method(:discountable_amount).to(:discountable) }
  end

  describe "enums" do
    it { is_expected.to define_enum_for(:discount_type).with([:amount, :percent])}
  end

  describe "return total discount" do
    it "for no discount" do
      order = create(:order)

      expect(Discount.total(order)).to eql(0)
    end

    it "for discounts based on amount" do
      order = create(:order)
      discount = create(:discount, discount_type: "amount", amount: 100, discountable: order)

      expect(Discount.total(order)).to eql(100)
    end

    it "for discounts based on percent" do
      order = create(:order)
      line_item = create(:line_item, unit_cost: 100, quantity: 1, order: order)

      discount = create(:discount, discount_type: "percent", percent: 0.1, discountable: order)

      expect(Discount.total(order)).to eql(10)
    end

  end
end

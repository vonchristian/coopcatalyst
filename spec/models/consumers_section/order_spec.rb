require 'rails_helper'

module ConsumersSection
  describe Order do
    describe "associations" do
      it { is_expected.to have_one :discount }
      it { is_expected.to have_one :discount }
      it { is_expected.to belong_to :member }
      it { is_expected.to belong_to :user }
    end
    describe "delegations" do
      it { is_expected.to delegate_method(:amount).to(:discount).with_prefix }
      it { is_expected.to delegate_method(:percent).to(:discount).with_prefix }
      it { is_expected.to delegate_method(:amount?).to(:discount).with_prefix }
      it { is_expected.to delegate_method(:percent?).to(:discount).with_prefix }
    end

    describe "enums" do
      it { is_expected.to define_enum_for(:pay_type).with([:cash, :credit])}
    end

    it "#add_line_items_from_cart(cart)" do
      cart = create(:cart)
      line_item = create(:line_item, cart: cart)
      line_item_2 = create(:line_item, cart: cart)
      order = create(:order)
      order.add_line_items_from_cart(cart)

      expect(order.line_items).to include(line_item)
      expect(order.line_items).to include(line_item_2)
      expect(order.line_items.count).to eql(2)
    end

    it "#total_cost" do
      order = create(:order)
      line_item = create(:line_item, unit_cost: 1, quantity: 1, order: order)

      expect(order.total_cost).to eql(1)
    end

    it "#total_discount" do
      order = create(:order)
      discount = create(:discount, discountable: order, amount: 10, discount_type: "amount")

      expect(order.total_discount).to eql(10)
    end

    it "#discounted?" do
      order = create(:order)
      order_2 = create(:order)
      discount = create(:discount, discountable: order, amount: 10, discount_type: "amount")

      expect(order.discounted?).to be true
      expect(order_2.discounted?).to be false
    end

    it "#pay_type_color" do
      cash_order = create(:order, pay_type: "cash")
      credit_order = create(:order, pay_type: "credit")

      expect(cash_order.pay_type_color).to eql("success")
      expect(credit_order.pay_type_color).to eql("danger")
    end
  end
end

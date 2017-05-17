require 'rails_helper'
module ConsumersSection
  describe LineItem do
    describe "associations" do
      it { is_expected.to belong_to :cart }
      it { is_expected.to belong_to :order }
      it { is_expected.to belong_to :stock }
    end

    describe "delegations" do
      it { is_expected.to delegate_method(:product_name).to(:stock) }
      it { is_expected.to delegate_method(:unit).to(:stock) }
      it { is_expected.to delegate_method(:order_date).to(:order) }
      it { is_expected.to delegate_method(:member_full_name).to(:order) }
    end

    it ".cash" do
      order = create(:order, pay_type: "cash")
      line_item = create(:line_item, order: order)
      order_2 = create(:order, pay_type: "credit")
      line_item_2 = create(:line_item, order: order_2)

      expect(ConsumersSection::LineItem.cash).to include(line_item)
      expect(ConsumersSection::LineItem.cash).to_not include(line_item_2)
    end

    it ".credit" do
      order = create(:order, pay_type: "cash")
      line_item = create(:line_item, order: order)
      order_2 = create(:order, pay_type: "credit")
      line_item_2 = create(:line_item, order: order_2)

      expect(ConsumersSection::LineItem.credit).to include(line_item_2)
      expect(ConsumersSection::LineItem.credit).to_not include(line_item)
    end

    it ".total_cost" do
      line_item = create(:line_item, unit_cost: 10, quantity: 1)
      line_item_2 = create(:line_item, unit_cost: 20, quantity: 1)

      expect(ConsumersSection::LineItem.total_cost).to eql(30)
    end

    it "#total_cost" do
      line_item = create(:line_item, unit_cost: 10, quantity: 1)

      expect(line_item.total_cost).to eql(10)
    end
    it "#profit" do
      stock = create(:stock, purchase_cost: 10)
      line_item = create(:line_item, stock: stock, unit_cost: 20)

      expect(line_item.profit).to eql(10)
    end
  end
end

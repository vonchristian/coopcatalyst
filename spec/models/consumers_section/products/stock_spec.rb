require 'rails_helper'
module ConsumersSection
  module Products
    describe Stock do
      describe "associations" do
        it { is_expected.to have_one :discount }
        it { is_expected.to have_one :freight_in }
        it { is_expected.to belong_to :product }
        it { is_expected.to belong_to :supplier }
        it { is_expected.to belong_to :user }
        it { is_expected.to have_many :line_items }
      end

      describe "delegations" do
        it { is_expected.to delegate_method(:name).to(:product).with_prefix }
        it { is_expected.to delegate_method(:unit).to(:product).with_prefix }
        it { is_expected.to delegate_method(:first_name).to(:user).with_prefix }
        it { is_expected.to delegate_method(:full_name).to(:user).with_prefix }
        it { is_expected.to delegate_method(:business_name).to(:supplier).with_prefix }
        it { is_expected.to delegate_method(:amount).to(:discount).with_prefix }
        it { is_expected.to delegate_method(:amount?).to(:discount).with_prefix }
        it { is_expected.to delegate_method(:percent?).to(:discount).with_prefix }
        it { is_expected.to delegate_method(:percent).to(:discount).with_prefix }

        it { is_expected.to delegate_method(:amount).to(:freight_in).with_prefix }
      end

      describe "nested attributes" do
        it { is_expected.to accept_nested_attributes_for(:discount) }
        it { is_expected.to accept_nested_attributes_for(:freight_in) }
      end

      it ".total" do
        stock = create(:stock, quantity: 2)
        stock_2 = create(:stock, quantity: 2)

        expect(ConsumersSection::Products::Stock.total).to eql(4)
      end

      it ".sold" do
        stock = create(:stock, quantity: 100)
        line_item = create(:line_item, stock: stock, quantity: 10)

        expect(ConsumersSection::Products::Stock.sold).to eql(10)
      end

      it ".in_stock" do
        stock = create(:stock, quantity: 100)
        line_item = create(:line_item, stock: stock, quantity: 10)

        expect(ConsumersSection::Products::Stock.in_stock).to eql(90)
      end

      describe "#total_cost" do
        it "without discount and without freight in" do
          stock = create(:stock, quantity: 10, purchase_cost: 10)

          expect(stock.total_cost).to eql(100)
        end

        it "with discount and without freight in" do
          stock = create(:stock, quantity: 10, purchase_cost: 10, discounted: true)
          discount = create(:discount, discountable: stock, discount_type: "amount", amount: 10)

          expect(stock.total_cost).to eql(90)
        end

        it "with discount and with freight in" do
          stock = create(:stock, quantity: 10, purchase_cost: 10, has_freight: true)
          discount = create(:discount, discountable: stock, discount_type: "amount", amount: 10)
          fregiht_in = create(:freight_in, freightable: stock, amount: 20)

          expect(stock.total_cost).to eql(110)
        end
      end

      it "#total_discount" do
        stock = create(:stock)
        discounted_stock = create(:stock)
        discount = create(:discount, discountable: discounted_stock, amount: 10, discount_type: "amount" )

        expect(stock.total_discount).to eql(0)
        expect(discounted_stock.total_discount).to eql(10)
      end

      it "#total_freight_in" do
        stock = create(:stock, has_freight: true)
        fregiht_in = create(:freight_in, freightable: stock, amount: 20)

        expect(stock.total_freight_in).to eql(20)
      end

      it "#discounted?" do
        stock = create(:stock)
        stock_2 = create(:stock)
        discount = create(:discount, discountable: stock)

        expect(stock.discounted?).to be true
        expect(stock_2.discounted?).to be false
      end

      it "#.in_stock" do
        stock = create(:stock,  quantity: 10)
        line_item = create(:line_item, stock: stock, quantity: 1)

        expect(stock.in_stock).to eql(9)
      end

      it "#sold" do
        stock = create(:stock,  quantity: 10)
        line_item = create(:line_item, stock: stock, quantity: 1)

        expect(stock.sold).to eql(1)
      end
    end
  end
end

require 'rails_helper'

describe Freight do
  describe "associations" do
    it { is_expected.to belong_to :freightable }
  end
  describe "total" do
    it "with freight" do
      stock = create(:stock, has_freight: true)
      freight = create(:freight_in, amount: 100, freightable: stock)

      expect(Freight.total(stock)).to eql(100)
    end
    it "with no freight" do
      stock = create(:stock, has_freight: false)
      expect(Freight.total(stock)).to eql(0)
    end
  end
end

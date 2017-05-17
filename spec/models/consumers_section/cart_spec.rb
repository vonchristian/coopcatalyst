require 'rails_helper'
module ConsumersSection
  describe Cart do
    describe "associations" do
      it { is_expected.to belong_to :user }
      it { is_expected.to have_many :line_items }
      it { is_expected.to have_many :stocks }
    end

    it "#add_line_item(line_item)" do
      cart = create(:cart)
      expect(cart.line_items).to be_empty

      line_item = create(:line_item)
      cart.add_line_item(line_item)

      expect(cart.line_items).to be_present
    end
  end
end

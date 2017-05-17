require 'rails_helper'

module ConsumersSection
  describe Product do
    describe "associations" do
      it { is_expected.to belong_to :product_category }
      it { is_expected.to have_many :stocks }
      it { is_expected.to have_many :line_items }
    end

    describe "photo_attachment" do
      it { is_expected.to have_attached_file(:photo) }
      it { is_expected.to validate_attachment_content_type(:photo).allowing('image/png', 'image/gif').rejecting('text/plain', 'text/xml') }
    end

    describe "delegations" do
      it { is_expected.to delegate_method(:name).to(:product_category).with_prefix }
    end

    it "#deliveries" do
      product = create(:product)
      stock = create(:stock, quantity: 10, product: product)
      stock_2 = create(:stock, quantity: 10, product: product)

      expect(product.deliveries).to eql(20)
    end

    it "#sold" do
      product = create(:product)
      stock = create(:stock, quantity: 10, product: product)
      line_item = create(:line_item, stock: stock, quantity: 5)

      expect(product.sold).to eql(5)
    end
    it "#in_stock" do
      product = create(:product)
      stock = create(:stock, quantity: 20, product: product)
      line_item = create(:line_item, stock: stock, quantity: 5)

      expect(product.in_stock).to eql(15)
    end
  end
end

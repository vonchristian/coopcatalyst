module ConsumersSection
  module LineItems
    class PurchaseOrderLineItem < LineItem
      delegate :name, to: :itemable, allow_nil: true
      delegate :unit, to: :itemable, allow_nil: true
    end
  end
end

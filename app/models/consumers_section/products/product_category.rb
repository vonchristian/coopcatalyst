module ConsumersSection
  module Products
    class ProductCategory < ApplicationRecord
      has_many :products, class_name: "ConsumersSection::Product"

      validates :name, presence: true, uniqueness: true
    end
  end
end

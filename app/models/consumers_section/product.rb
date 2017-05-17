module ConsumersSection
  class Product < ApplicationRecord
    belongs_to :product_category, class_name: "ConsumersSection::Products::ProductCategory"
    has_many :stocks, class_name: "ConsumersSection::Products::Stock"
    has_many :line_items, through: :stocks, class_name: "ConsumersSection::LineItem"
    has_attached_file :photo,
                      styles: { large: "120x120>",
                                medium: "70x70>",
                                thumb: "40x40>",
                                small: "30x30>",
                                x_small: "20x20>"},
                      default_url: ":style/default_product.jpg",
                      :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
                      :url => "/system/:attachment/:id/:style/:filename"

    validates_attachment :photo,
                       content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
    delegate :name, to: :product_category, prefix: true, allow_nil: true

    #move THIS METHOD TO SALES REPORT
    def cash_sales
      stocks.cash_sales
    end

    def deliveries
      stocks.total
    end

    def sold
      stocks.sold
    end

    def in_stock
      stocks.in_stock
    end

    def deliveries_with_unit
      "#{deliveries} #{unit}"
    end
  end
end

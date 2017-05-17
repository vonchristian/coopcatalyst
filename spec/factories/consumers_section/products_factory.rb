FactoryGirl.define do
  factory :product, class: "ConsumersSection::Product" do
    name "MyString"
    description "MyString"
    unit "MyString"
    photo ""
    stock_alert false
  end
end

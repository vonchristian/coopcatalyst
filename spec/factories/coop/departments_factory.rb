FactoryGirl.define do
  factory :department, class: "Coop::Department" do
    cooperative nil
    name "MyString"
  end
end

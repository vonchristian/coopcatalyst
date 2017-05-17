FactoryGirl.define do
  factory :department, class: "Coop::Department" do
    branch nil
    name "MyString"
  end
end

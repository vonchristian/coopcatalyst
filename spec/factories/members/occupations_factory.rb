FactoryGirl.define do
  factory :occupation, class: "Members::Occupation" do
    title { Faker::Company.profession }
    member nil
  end
end

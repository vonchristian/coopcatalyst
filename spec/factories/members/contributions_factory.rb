FactoryGirl.define do
  factory :contribution, class: "Members::Contribution" do
    member nil
    program nil
    amount "9.99"
    date "2017-02-05 20:59:36"
    entry nil
  end
end

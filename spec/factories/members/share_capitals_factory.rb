FactoryGirl.define do
  factory :share_capital, class: "Members::ShareCapital" do
    account_number "MyString"
    member
  end
  factory :common, :class => ShareCapitals::Common do |common|
    account_number "MyString"
    association :member
  end

  factory :preferred, :class => ShareCapitals::Preferred do |preferred|
    account_number "MyString"
    association :member
  end
end

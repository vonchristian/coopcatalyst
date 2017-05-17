FactoryGirl.define do
  factory :member do
    first_name  { Faker::Name.first_name}
    middle_name  { Faker::Name.first_name }
    last_name  { Faker::Name.first_name }
    contact_number {Faker::Number.number(11)}
    email {Faker::Internet.email}
    sex 1
    civil_status 1
    date_of_birth {Faker::Date.backward(18)}
  end
end

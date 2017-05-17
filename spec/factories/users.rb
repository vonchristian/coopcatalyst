FactoryGirl.define do
  factory :user do
      sequence(:email) { |n| "#{}person#{n}@example.com" }
      password 'secret12345'
      password_confirmation 'secret12345'
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
      role 'cashier'
      department
      branch
    end
  end

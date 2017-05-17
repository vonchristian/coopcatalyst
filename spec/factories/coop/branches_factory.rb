FactoryGirl.define do
  factory :branch, class: "Coop::Branch" do
    cooperative nil
    name "MyString"
    address "MyString"
    contact_number "MyString"

    factory :main_branch do
      branch_type "Coop::Branches::MainBranch"
    end
    factory :sattelite_branch do
      branch_type "Coop::Branches::SatteliteBranch"
    end
  end
end

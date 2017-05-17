module Members
  class Subscription < ApplicationRecord
    belongs_to :member
    belongs_to :program, class_name: "Coop::Program"
  end
end

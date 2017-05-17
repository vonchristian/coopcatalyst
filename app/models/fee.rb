class Fee < ApplicationRecord
  belongs_to :feeable, polymorphic: true
end

module Coop
  class Branch < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    belongs_to :cooperative
    has_many :departments, class_name: "Coop::Department"
    has_many :members

    validates :name, presence: true, uniqueness: true
    validates :contact_number, :address, presence: true

    enum branch_type: [:main, :sattelite]
  end
end

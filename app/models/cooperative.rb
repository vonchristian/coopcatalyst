class Cooperative < ApplicationRecord
  has_many :programs, class_name: "Coop::Program"
  has_many :branches, class_name: "Coop::Branch"
  has_many :departments, through: :branches, class_name: "Coop::Department"
  validates :name, :address, :contact_number, presence: true
end

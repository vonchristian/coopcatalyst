class Supplier < ApplicationRecord
  has_many :businesses, as: :owner

  accepts_nested_attributes_for :businesses
  
  def full_name
    "#{first_name} #{last_name}"
  end
end

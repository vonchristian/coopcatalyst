class Business < ApplicationRecord
  belongs_to :owner, polymorphic: true

  validates :name, presence: true, uniqueness: { scope: :owner_id }
  validates :contact_number, :address, presence: true
end

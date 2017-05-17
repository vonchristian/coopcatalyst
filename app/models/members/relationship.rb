module Members
  class Relationship < ApplicationRecord
    belongs_to :relationer, class_name: "Member", foreign_key: 'relationer_id'
    belongs_to :relationee, class_name: "Member", foreign_key: 'relationee_id'

    enum relationship_type: [:mother, :father, :brother, :sister, :daughter, :son, :grandfather, :grandmother, :wife, :husband]

    validates :relationer_id, presence: true
    validates :relationee_id, presence: true 

  end
end

class Member < ApplicationRecord
  include PublicActivity::Common
  include PgSearch
  extend FriendlyId
  friendly_id :full_name, use: :slugged

  multisearchable :against => [:name],
                             :order_within_rank => "members.created_at DESC"

                             has_attached_file :avatar,
                                               styles: { large: "120x120>",
                                                         medium: "70x70>",
                                                         thumb: "40x40>",
                                                         small: "30x30>",
                                                         x_small: "20x20>"},
                                               default_url: ":style/default_product.jpg",
                                               :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
                                               :url => "/system/:attachment/:id/:style/:filename"

                             validates_attachment :avatar,
                                                content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  has_one :membership_fee, class_name: "Fees::MembershipFee", as: :feeable
  has_many :orders, class_name: "ConsumersSection::Order"
  has_many :line_items, through: :orders, class_name: "ConsumersSection::LineItem"
  has_many :share_capitals, class_name: "Members::ShareCapital"
  has_one :common_share_capital, class_name: "ShareCapitals::Common"
  has_one :preferred_share_capital, class_name: "ShareCapitals::Preferred"
  belongs_to :branch, class_name: 'Coop::Branch'
  has_many :occupations, class_name: "Members::Occupation"
  has_many :loans, class_name: "LoansSection::Loan"
  has_one :latest_loan, -> { order('created_at desc') }, class_name: 'LoansSection::Loan'
  has_many :savings, class_name: "Members::Saving"
  has_many :time_deposits, class_name: "Members::TimeDeposit"
  has_many :active_relationships, class_name: "Members::Relationship", foreign_key: 'relationer_id'
  has_many :passive_relationships, class_name: "Members::Relationship", foreign_key: 'relationee_id'
  has_many :relations, through: :active_relationships, source: :relationee
  has_many :relationers, through: :passive_relationships, source: :relationer
  has_many :contributions, class_name: "Members::Contribution"
  has_many :subscriptions, class_name: "Members::Subscription"



  validates :first_name, :middle_name, :last_name, :contact_number,
                 :date_of_birth, :civil_status, :sex, presence: true
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :contact_number, length:{minimum: 11, maximum: 12}


  enum sex:[:male, :female]
  enum civil_status:[:married, :single, :widower, :annulled]

   accepts_nested_attributes_for :occupations
  delegate :account_number, :balance, to: :common_share_capital, prefix: true, allow_nil: true
  delegate :account_number, :balance, to: :preferred_share_capital, prefix: true, allow_nil: true

  after_commit :create_subscriptions
  def self.possible_relationship(member)
    all.select{ |a| a.last_name == member.last_name }
  end
  def relationship(member)
    relationships.count
  end
  def active_relation(relation)
    relation = active_relationships.where(:relationee => relation).first
    relation.present?
    relation.try(:relationship_type)
  end
  def passive_relation(relation)
    relation = passive_relationships.where(:relationer => relation).first
    relation.present?
    relation.try(:relationship_type)
  end
  def name
    full_name
  end

  def full_name
    "#{self.first_name.try(:titleize)} #{self.middle_name.try(:first).try(:capitalize)}. #{self.last_name.try(:titleize)}"
  end

  def address
    "#{self.address_sitio.titleize}, #{self.address_barangay.titleize}, #{self.address_municipality.titleize}, #{self.address_province.titleize}"
  end

  def current_occupation
    Members::Occupation.current(self)
  end


  def first_and_last_name
    "#{first_name.try(:titleize)} #{last_name.try(:titleize)}"
  end

  private
  def create_subscriptions
    Coop::Program.default.all.each do |program|
      subscriptions.create(program: program, subscriber: self)
    end
  end
end

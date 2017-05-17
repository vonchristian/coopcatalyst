class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:manager, :loan_officer, :teller, :cashier]
  belongs_to :branch, class_name: "Coop::Branch"
  belongs_to :department, class_name: "Coop::Department"
  has_many :entries, class_name: "Accounting::Entry", foreign_key: "recorder_id"


  has_attached_file :avatar, styles: { medium: "300x300>",
                                                           thumb: "100x100#", small: "50x50#"}, default_url: ":style/profile_default.jpg"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :department_id, presence: true

  delegate :name, to: :branch, prefix: true, allow_nil: true
  delegate :name, to: :department, prefix: true, allow_nil: true
  # after_commit :set_branch
  def full_name
    "#{first_name} #{last_name}"
  end

  private
  def set_branch
    self.branch = self.department.branch
    self.save
  end
end

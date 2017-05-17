class MemberPolicy
  attr_reader :user, :post

  def initialize(user, member)
    @user = user
    @member = member
  end

  def new?
    user.manager?
  end
end

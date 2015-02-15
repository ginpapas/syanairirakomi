class Search::SyanaiUser < Search::Base
  attr_accessor :username

  def initialize(attributes = {})
    super attributes if attributes.present?
  end

  def matches
    user = User.all
    user = user.where("username like ?", "%#{self.username}%") if self.username.present?  
    user
  end
end

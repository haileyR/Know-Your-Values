class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: "User"

  protected
  before_create do
    other = Friendship.find_by(user_id: self.friend_id, friend_id: self.user_id)
    if other
      other.update(status: true)
      self.status = true
    end
  end
end

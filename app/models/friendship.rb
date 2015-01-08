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

  def self.friends(id)
    friendships = Friendship.where(user_id: id, status: true)
    friendships.map{|friendship| User.find(friendship.friend_id)}
  end

  def self.friend_requests(id)
    friendships = Friendship.where(friend_id: id, status: nil)
    friends = friendships.map{|friendship| User.find(friendship.user_id)}
  end
end

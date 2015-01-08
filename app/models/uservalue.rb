class Uservalue < ActiveRecord::Base
  belongs_to :user
  belongs_to :value

  def self.values_of_user(user_id)
    valueIDs = Uservalue.where(user_id: user_id).map{ |us|us.value_id }
    valueIDs.map { |vID| Value.find(vID) }
  end
end

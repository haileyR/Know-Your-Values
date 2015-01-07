class Uservalue < ActiveRecord::Base
  belongs_to :user
  belongs_to :value
end

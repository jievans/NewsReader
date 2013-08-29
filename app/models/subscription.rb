class Subscription < ActiveRecord::Base
  attr_accessible :feed_id, :user_id

  validates :feed_id, :user_id, :presence => true

  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :feed, :class_name => "Feed", :foreign_key => "feed_id"
end

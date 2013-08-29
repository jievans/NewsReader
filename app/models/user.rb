require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  attr_accessible :password_digest, :username, :password

  before_validation :generate_token

  has_many :subscriptions, :class_name => "Subscription",
           :foreign_key => :user_id

  has_many :feeds, :through => :subscriptions, :source => :feed

  validates :username, :uniqueness => true

  def favorite_feed_ids
    self.subscriptions.where("favorite = true").pluck("feed_id")
  end

  def generate_token
    puts "!!!!!!!!!!!!!! Regenerating Session Token!"
    self.session_token = SecureRandom.urlsafe_base64(16)
    puts "User's session token is now #{self.session_token}"
  end

  def password_equals?(other_password)
    Password.new(self.password_digest).is_password?(other_password)
  end

  def password=(new_password)
    self.password_digest = Password.create(new_password).to_s
  end


end

require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  attr_accessible :password_digest, :username, :password
  after_initialize :generate_token
  def generate_token
    self.session_token = SecureRandom.urlsafe_base64(16)
  end

  def password_equals?(other_password)
    Password.new(self.password_digest).is_password?(other_password)
  end

  def password=(new_password)
    self.password_digest = Password.create(new_password).to_s
  end


end

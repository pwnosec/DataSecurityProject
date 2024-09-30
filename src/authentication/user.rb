require 'bcrypt'

class User
  attr_accessor :username, :password_hash

  def initialize(username, password)
    @username = username
    @password_hash = BCrypt::Password.create(password)
  end

  def valid_password?(password)
    BCrypt::Password.new(@password_hash) == password
  end
end

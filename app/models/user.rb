class User < ActiveRecord::Base
  include BCrypt
  has_many :quaps

  def authenticate(plaintext_password)
    self.password == plaintext_password
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end

class User < ApplicationRecord
  attr_reader :password
  after_initialize :ensure_session_token
  validates :user_name, :password_digest, :session_token, presence: true
  validates :session_token, uniqueness: true

  def self.find_by_credential(user_name, password)
    user = User.find_by(user_name: user_name)
    if user && user.is_password?(password)
      user
    else
      nil
    end
  end


  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token ||= SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest) == password
  end
end

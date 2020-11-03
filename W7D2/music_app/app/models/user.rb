class User < ApplicationRecord
  after_initializ :ensure_session_token
  attr_reader :password
  validates :username, :email, :password_digest, :session_token, presence: true
  validates :username, uniqueness: { case_sensitive: false }, length: { maximum: 16 }
  validates :email, uniqueness: { case_sensitive: false }
  validates :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  def self.find_by_credentials(email, password)
    @user = User.find_by(email: email)
    @user && @user.is_password?(password) && @user
  end
  def self.generate_session_token(user)
    user.session_token = SecureRandom::urlsafe_base64
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest) == password
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  private

  def ensure_session_token!
    self.session_token ||= User.generate_session_token
  end
end

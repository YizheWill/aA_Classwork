{
  "flash_errors": {
    "prefix": "flash",
    "body": "flash.${1:now}[:errors] = @${2:instance}.errors.full_messages #['$3']"
  },
  "validates": {
    "prefix": "validates",
    "body": "validates :${1:column}, presence: true, uniqueness: true",
    "description": "validates"
  },
  "redirect_to": {
    "prefix": "redirectto",
    "body": "redirect_to ${1:action}_url",
    "description": "redirect"
  },
  "sr": {
    "prefix": "sr",
    "body": "SecureRandom::urlsafe_base64$1",
    "description": "secure random"
  },
  "fsl": {
    "prefix": "fsl",
    "body": ["# frozen_string_literal: true", "", "# class $1 documentation"],
    "description": "frozen string literal"
  },
  "session_and_password": {
    "prefix": "spire",
    "body": [
      "attr_reader :password",
      "",
      "before_validation :ensure_session_token!",
      "validates :username, presence: true, uniqueness: true",
      "validates :password_digest, presence: true",
      "validates :session_token, presence: true, uniqueness: true",
      "validates :password, length: { minimum: 6, allow_nil: true }",
      "# has_many :${1:posts}",
      "def self.find_by_credentials(username, password)",
      "  user = User.find_by(username: username)",
      "  user&.is_password?(password) ? user : nil",
      "end",
      "",
      "def self.generate_session_token",
      "  SecureRandom::urlsafe_base64",
      "end",
      "",
      "def password=(password)",
      "  @password = password",
      "  self.password_digest = BCrypt::Password.create(password)",
      "end",
      "",
      "def is_password?(password)",
      "  BCrypt::Password.new(self.password_digest) == password",
      "end",
      "",
      "def reset_session_token!",
      "  self.session_token = User.generate_session_token",
      "  self.save!",
      "  self.session_token",
      "end",
      "",
      "private",
      "",
      "def ensure_session_token!",
      "  self.session_token ||= User.generate_session_token",
      "end"
    ],
    "description": "session and password"
  },
  "nullfalse": {
    "prefix": "nullfalse",
    "body": "null: false",
    "description": "null false"
  },
  "crlll": {
    "prefix": "crlll",
    "body": [
      "helper_method :current_user",
      "def current_user",
      "  @current_user ||= User.find_by(session_token: session[:session_token])",
      "end",
      "",
      "def login!(user)",
      "  @current_user = user",
      "  session[:session_token] = user.reset_session_token!",
      "end",
      "",
      "def required_logged_in",
      "  redirect_to new_session_url unless logged_in?",
      "end",
      "",
      "def logged_in?",
      "  !!current_user",
      "end",
      "",
      "def logout!",
      "  current_user.reset_session_token! if logged_in?",
      "  session[:session_token] = nil",
      "  @current_user = nil",
      "end"
    ],
    "description": "login logut"
  },
  "val": {
    "prefix": "value",
    "body": "value='<%= $1 %>'",
    "description": "value"
  },
  "action": {
    "prefix": "act",
    "body": "action='<%= $1 %>'",
    "description": "action"
  },
  "erb_tag": {
    "prefix": "pe",
    "body": "<%= $1 %>",
    "description": "pe"
  }
}

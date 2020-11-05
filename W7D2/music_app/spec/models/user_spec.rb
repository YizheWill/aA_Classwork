# frozen_string_literal: true

# class  documentation
require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryBot.build(:user, email: 'will@wang.com', password: '123456') }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  it 'creates a password digest when a password is given' do
    expect(user.password_digest).to_not be_nil
  end

  it 'create a session_token' do
    user.valid?
    expect(user.session_token).to_not be_nil
  end

  describe '#reset_session_token' do
    it 'sets a new session token on the user' do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(old_session_token)
    end
    it 'returns new session token' do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe 'User #is_password?' do
    it 'tests the password to be right' do
      expect(user.is_password?('000000')).to be false
    end
    it 'test the wrong password to be wrong' do
      expect(user.is_password?('123456')).to be true
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'is not valid without a password' do
      user = User.new(name: 'Dave', email: 'dave@email.com')
      expect(user).to_not be_valid
    end

    it 'is not valid without password confirmation' do
      user = User.new(name: 'Dave', email: 'dave@email.com', password: 'hellooo', password_confirmation: 'yoyoyoyo')
      expect(user).to_not be_valid
    end

    it 'is not valid if no email' do
      user = User.new(name: 'Dave', password: 'hellooo', password_confirmation: 'yoyoyoyo')
      expect(user).to_not be_valid
    end

    it 'is not valid if email already exists' do
      user = User.new(name: 'Dave', email: 'dave@email.com', password: 'hellooo', password_confirmation: 'yoyoyoyo')
      user2 = User.new(name: 'Dave', email: 'DAVE@email.com', password: 'hellooo', password_confirmation: 'yoyoyoyo')
      expect(user2).to_not be_valid
    end

    it 'is not valid if password is less than 6 characters' do
      user = User.new(name: 'Dave', email: 'dave@email.com', password: 'hi', password_confirmation: 'hi')
      expect(user).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    it 'should sign in if email and password authorized' do
      user = User.create(name: 'Dave', email: 'dave@email.com', password: 'helloo', password_confirmation: 'helloo')
      expect(User.authenticate_with_credentials('dave@email.com', 'helloo')).to be_present
    end

    it 'should sign in if email has different case than when created' do
      user = User.create(name: 'Dave', email: 'dave@email.com', password: 'helloo', password_confirmation: 'helloo')
      expect(User.authenticate_with_credentials('dAVe@email.com', 'helloo')).to be_present
    end

    it 'should sign in if email has spaces before or after' do
      user = User.create(name: 'Dave', email: 'dave@email.com', password: 'helloo', password_confirmation: 'helloo')
      expect(User.authenticate_with_credentials('  dave@email.com', 'helloo')).to be_present
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "validates a user has matching password and password confirmation fields" do
      @user = User.new(email: 'bob@bobbi.com', first_name: 'Bobby', last_name: 'Boy', password: '12345', password_confirmation: '12345')
      expect(@user.password).to eq(@user.password_confirmation)
      expect(@user.save).to be true
    end
    it "validates a user cannot signup without password and password confirmation fields" do
      @user = User.new(email: 'bob@bobbi.com', first_name: 'Bobby', last_name: 'Boy', password: '12347', password_confirmation: '12345')
      expect(@user.password).not_to eq(@user.password_confirmation)
      expect(@user.save).to be false
    end
    it "validates a password must be of minimum length" do
      @user = User.new(email: 'bob@bobbi.com', first_name: 'Bobby', last_name: 'Boy', password: '123', password_confirmation: '123')
      expect(@user.save).to be false
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end
    it "validates a password must be of minimum length" do
      @user = User.new(email: 'bob@bobbi.com', first_name: 'Bobby', last_name: 'Boy', password: '123', password_confirmation: '123')
      expect(@user.save).to be false
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end
  end
  describe '.authenticate_with_credentials' do
    it "successfully authenticates the user" do
      @user = User.create(email: 'bob@bobbi.com', first_name: 'Bobby', last_name: 'Boy', password: '12345', password_confirmation: '12345').save
      # expect(@user.save).to be true
      expect(User.authenticate_with_credentials('bob@bobbi.com', '12345')).to be true
    end
  end
end

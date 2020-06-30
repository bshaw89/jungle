require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "validates a user has matching password and password confirmation fields" do
      @user = User.new(email: 'bob@bobbi.com', password: '123', password_confirmation: '123')
      expect(@user.password).to match(@user.password_confirmation)
      expect(@user.save).to be true
    end
  end
end

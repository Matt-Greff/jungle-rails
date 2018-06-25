require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    user = User.new
    before(:each) do
      user.email = 'matt@example.com' # valid state
      user.password = "asdfasdf" # valid state
      user.password_confirmation = "asdfasdf" # valid state
    end
    it 'should validate email' do
      user.email = nil
      user.valid? # run validations
      expect(user.errors[:email]).to include("can't be blank") # check for presence of error

      user.email = 'matt@q.com' # valid state
      user.valid? # run validations
      expect(user.errors[:email]).to_not include("can't be blank") # check for absence of error
    end
    it 'should only accept unique email' do
      User.create({email: 'matt@example.com', password: "asdfasdf", password_confirmation: "asdfasdf"})
      user.valid? # run validations
      expect(user.errors[:email]).to include("has already been taken") # check for presence of error

      User.create({email: 'M@M.com', password: "asdfasdf", password_confirmation: "asdfasdf"})
      user.email = 'm@m.com' # valid state
      user.valid? # run validations
      expect(user.errors[:email]).to include("has already been taken") # check for absence of error

      user.email = '  m@m.com  '
      user.valid?
      expect(user.errors[:email]).to include("has already been taken") # check for absence of error
    end
    it 'should validate password' do
      user.password = nil
      user.valid? # run validations
      expect(user.errors[:password]).to include("can't be blank") # check for presence of error
      
      user.password = "asdfasdf" # valid state
      user.valid? # run validations
      expect(user.errors[:password]).to_not include("can't be blank") # check for absence of error
    end
    it 'should reject passwords less than 3 char\'s' do
        user.password = '12'
        user.valid?
        expect(user.errors[:password]).to include("is too short (minimum is 3 characters)") # check for presence of error
    end
  end
  describe '.authenticate_with_credentials' do
    it 'should reject unauthorized login' do
      user = User.create({email: 'matt@matt.com', password: '1234', password_confirmation: '1234'})
      expect(User.authenticate_with_credentials 'matt@matt.com', '1254').to eq(nil)
      expect(User.authenticate_with_credentials 'matt@matt.com', '1234').to eq(user)
      expect(User.authenticate_with_credentials '   matt@matt.com    ', '1234').to eq(user)
    end
  end
end

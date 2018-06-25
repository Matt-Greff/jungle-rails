require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#name' do
    it 'should validate presence' do
      record = Product.new
      record.name = nil # invalid state
      record.valid? # run validations
      record.errors[:name].should include("can't be blank") # check for presence of error

      record.name = 'chair' # valid state
      record.valid? # run validations
      record.errors[:name].should_not include("can't be blank") # check for absence of error
    end
  end
end

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#product' do
    it 'should create product' do
      cat = Category.new({name: "furniture", })
      product = cat.products.new
      product.name = 'chair' # valid state
      product.price = 100.00 # valid state
      product.quantity = 100 # valid state
    end
  end
  describe '#name' do
    it 'should validate presence' do
      product = Product.new
      product.name = nil # invalid state
      product.valid? # run validations
      expect(product.errors[:name]).to include("can't be blank") # check for presence of error

      product.name = 'chair' # valid state
      product.valid? # run validations
      expect(product.errors[:name]).to_not include("can't be blank") # check for absence of error
    end
  end
  describe '#price' do
    it 'should validate presence' do
      product = Product.new
      product.price = nil # invalid state
      product.valid? # run validations
      expect(product.errors[:price]).to include("can't be blank") # check for presence of error

      product.price = 100.00 # valid state
      product.valid? # run validations
      expect(product.errors[:price]).to_not include("can't be blank") # check for absence of error
    end
  end
  describe '#quantity' do
    it 'should validate presence' do
      product = Product.new
      product.quantity = nil # invalid state
      product.valid? # run validations
      expect(product.errors[:quantity]).to include("can't be blank") # check for presence of error

      product.quantity = 100 # valid state
      product.valid? # run validations
      expect(product.errors[:quantity]).to_not include("can't be blank") # check for absence of error
    end
  end
  describe '#category' do
    it 'should validate presence' do
      product = Product.new
      product.category = nil # invalid state
      product.valid? # run validations
      expect(product.errors[:category]).to include("can't be blank") # check for presence of error

      cat = Category.new({name: "furniture", })
      product = cat.products.new
      product.valid? # run validations
      expect(product.errors[:category]).to_not include("can't be blank") # check for absence of error
    end
  end
end

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "should be created if all fields are in" do
      @category = Category.new(name: 'Anything')
      @product = Product.new(name: 'Anything', price: 75, quantity: 1, :category => @category)
      expect(@product).to be_valid
    end
    it "is not valid without a name" do
      @category = Category.new(name: 'Anything')
      @product = Product.new(name: nil, price: 75, quantity: 1, :category => @category)
      expect(@product).to_not be_valid
    end
    it "is not valid without a price" do
      @category = Category.new(name: 'Anything')
      @product = Product.new(name: nil, quantity: 1, :category => @category)
      expect(@product).to_not be_valid
    end
    it "is not valid without a quantity" do
      @category = Category.new(name: 'Anything')
      @product = Product.new(name: nil, price: 12, :category => @category)
      expect(@product).to_not be_valid
    end
    it "is not valid without a category" do
      @category = Category.new(name: 'Anything')
      @product = Product.new(name: nil, quantity: 1, price: 12)
      expect(@product).to_not be_valid
    end
  end
end

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "validates a product with all four fields set will save" do
      @category = Category.new(name: "Stuff")
      @product = Product.new(name: 'Bob', price: 1, quantity: 1, category: @category).save
      expect(@product).to be true
    end
    it "should not validate if only the name field is set" do
      @category = Category.new(name: "Stuff")
      @product = Product.new(name: 'Bob', price: nil, quantity: nil, category: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank", "Quantity can't be blank", "Category can't be blank")
      expect(@product.save).to be false
    end
    it "should not validate if only the price field is set" do
      @category = Category.new(name: "Stuff")
      @product = Product.new(name: nil, price: 20, quantity: nil, category: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank", "Quantity can't be blank", "Category can't be blank")
      expect(@product.save).to be false
    end
    it "should not validate if only the quantity field is set" do
      @category = Category.new(name: "Stuff")
      @product = Product.new(name: nil, price: nil, quantity: 2, category: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank", "Name can't be blank", "Category can't be blank")
      expect(@product.save).to be false
    end
    it "should not validate if only the category field is set" do
      @category = Category.new(name: "Stuff")
      @product = Product.new(name: nil, price: nil, quantity: nil, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank", "Name can't be blank", "Quantity can't be blank")
      expect(@product.save).to be false
    end
  end
end

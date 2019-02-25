require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here


    it "is valid with valid attributes " do
      @category = Category.new(name: "Test Category")
      @category.save!
      puts @category
      @product = Product.new(name: "anisa", description:"test_descp", image:"image", price:2, quantity:3,  category_id: @category.id)
      expect(@product).to be_valid
    end
    
    it "is not valid without a name" do
      @category = Category.new(name: "Test Category")
      @category.save!
      puts @category
      @product = Product.new(name: nil, description:"test_descp", image:"image", price:2, quantity:3,  category_id: @category.id)
      expect(@product).to be_valid
    end

    it "is not valid without a price" do
      @category = Category.new(name: "Test Category")
      @category.save!
      puts @category
      @product = Product.new(name: "hello", description:"test_descp", image:"image", price:nil, quantity:3,  category_id: @category.id)
      expect(@product).to be_valid
    end
    it "is not valid without a quantity" do
      @category = Category.new(name: "Test Category")
      @category.save!
      puts @category
      @product = Product.new(name: "hello", description:"test_descp", image:"image", price:2, quantity:nil,  category_id: @category.id)
      expect(@product).to be_valid
    end
    it "is not valid without a category" do
      @category = Category.new(name: "Test Category")
      @category.save!
      puts @category
      @product = Product.new(name: "hello", description:"test_descp", image:"image", price:2, quantity:3,  category_id: nil)
      expect(@product).to be_valid
    end
    
  end
end
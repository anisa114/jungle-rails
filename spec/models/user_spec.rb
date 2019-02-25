require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
      # validation examples here

    it "is valid with valid attributes " do
      @user = User.new(name: "anisa", email:"john@hotmail.com", password:"hello", password_confirmation:"hello")
      @user.save!
      expect(@user).to be_valid
    end

    it "is not valid without matching fields " do
      @user = User.new(name: "anisa",email:"ben@hotmail.com", password:"hello", password_confirmation:"hi")
      expect(@user).to_not be_valid
    end

    it "is not valid without password " do
      @user = User.new(name: "anisa", email:"anisa@hotmail.com", password:nil, password_confirmation:"hello")
      expect(@user).to_not be_valid
    end

    it "is valid without password confirmation " do
      @user = User.new(name: "anisa",email:"halima@hotmail.com", password:"hello", password_confirmation:nil)
      expect(@user).to be_valid
    end


    it "is not valid without unique email " do
      @user1 = User.new(name: "anisa", email:"bob@hotmail.com", password:"hello", password_confirmation:"hello")
      @user1.save!
      @user = User.new(name: "anisa",email:"BOB@HOTMAIL.COM", password:"hello", password_confirmation:"hello")
      expect(@user).to_not be_valid
    end


    it "is not valid without required password length" do
      @user = User.new(name: "anisa",email:"sara@hotmail.com", password:"he", password_confirmation:"he")
      expect(@user).to_not be_valid
    end
  end



  describe '.authenticate_with_credentials' do
    it "is authenticated with correct email and password " do
      @user = User.new(name: "anisa",email:"sara@hotmail.com", password:"hello", password_confirmation:"hello")
      @user.save!
      user_auth = User.authenticate_with_credentials("  SarA@Hotmail.com ",@user.password)
      expect(user_auth).to_not be_nil
    end

    it "is not authenticated with wrong credentials" do
      @user = User.new(name: "jim",email:"jim@hotmail.com", password:"1234", password_confirmation:"1234")
      @user.save!
      user_auth = User.authenticate_with_credentials(@user.email,"123")
      expect(user_auth).to be_nil
    end

  end




end

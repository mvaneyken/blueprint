require 'spec_helper'

describe User do

  it { should validate_presence_of(:email) }

  describe User do
    before(:each) do
      @attr = {
        :name => "John Doe",
        :email => "john_doe@example.com",
        :password => "abcdef78",
        :password_confirmation => "abcdef78",
      }
    end

    describe "passwords" do
      before(:each) do
        @user = User.new(@attr)
      end
      it "should have a password attribute" do
        @user.should respond_to(:password)
      end
      it "should have a password confirmation attribute" do
        @user.should respond_to(:password_confirmation)
      end
    end
  
    describe "password validations" do
      it "should require a password" do
        User.new(@attr.merge(:password => "", :password_confirmation => "")).
          should_not be_valid
      end
      it "should require a matching password confirmation" do
        User.new(@attr.merge(:password_confirmation => "invalid")).
          should_not be_valid
      end
      it "should reject short passwords" do
        short = "a" * 5
        hash = @attr.merge(:password => short, :password_confirmation => short)
        User.new(hash).should_not be_valid
      end
    end

    describe "password encryption" do
      before(:each) do
        @user = User.create!(@attr)
      end
      it "should have an encrypted password attribute" do
        @user.should respond_to(:encrypted_password)
      end
      it "should set the encrypted password attribute" do
        @user.encrypted_password.should_not be_blank
      end
    end

  end

end

require 'spec_helper'

describe User do
  
  before(:each) do
    @attr = {
      :name => "Joey Ramone",
      :email => "joey@ramones.com",
      :password => "rockawaybeach"
    }
  end
  
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  
  it "creates a new instance given a valid attribute" do
    User.create!(@attr)
  end
  
  describe "emails" do
    it "requires a name" do
      no_name_user = User.new(@attr.merge(:name => ""))
      no_name_user.should_not be_valid
    end
    
    it "requires an email address" do
      no_email_user = User.new(@attr.merge(:email => ""))
      no_email_user.should_not be_valid
    end
  
    it "only accepts valid email addresses" do
      addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
      addresses.each do |address|
        valid_email_user = User.new(@attr.merge(:email => address))
        valid_email_user.should be_valid
      end
    end
  
    it "rejects invalid email addresses" do
       addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
       addresses.each do |address|
         invalid_email_user = User.new(@attr.merge(:email => address))
         invalid_email_user.should_not be_valid
       end
     end
   
    it "rejects duplicate email addresses" do
       User.create!(@attr)
       user_with_duplicate_email = User.new(@attr)
       user_with_duplicate_email.should_not be_valid
    end
  
    it "rejects email addresses identical up to case" do
      upcased_email = @attr[:email].upcase
      User.create!(@attr.merge(:email => upcased_email))
      user_with_duplicate_email = User.new(@attr)
      user_with_duplicate_email.should_not be_valid
    end
  end
  
  describe "passwords" do
    before(:each) do
      @user = User.new(@attr)
    end

    it "has a password" do
      @user.should respond_to(:password)
    end
  end
  
  describe "password validations" do
    it "requires a password" do
      User.new(@attr.merge(:password => "")).
        should_not be_valid
    end

    it "rejects short passwords" do
      short = "a" * 3
      hash = @attr.merge(:password => short)
      User.new(hash).should_not be_valid
    end

    it "rejects long passwords" do
      long = "a" * 41
      hash = @attr.merge(:password => long)
      User.new(hash).should_not be_valid
    end
  end
  
end
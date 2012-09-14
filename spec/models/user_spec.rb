require 'spec_helper'

describe User do

  before( :each ) do
    @user = FactoryGirl.build( :user )
  end

  describe "with invalid params" do
    it "like #first_name with nil value" do
      @user.first_name = nil
      @user.should_not be_valid
      @user.should have(1).errors_on(:first_name)
    end
    
    it "like #first_name with empty value" do
      @user.first_name = ''
      @user.should_not be_valid
      @user.should have(1).errors_on(:first_name)
    end

    it "like #last_name with nil value" do
      @user.last_name = nil
      @user.should_not be_valid
      @user.should have(1).errors_on(:last_name)
    end
    
    it "like #last_name with empty value" do
      @user.last_name = ''
      @user.should_not be_valid
      @user.should have(1).errors_on(:last_name)
    end

    it "like #email with nil value" do
      @user.email = nil
      @user.should_not be_valid
      @user.should have(1).errors_on(:email)
    end
    
    it "like #email with empty value" do
      @user.email = ''
      @user.should_not be_valid
      @user.should have(1).errors_on(:email)
    end

    it "like #username with nil value" do
      @user.username = nil
      @user.should_not be_valid
      @user.should have(1).errors_on(:username)
    end
    
    it "like #username with empty value" do
      @user.username = ''
      @user.should_not be_valid
      @user.should have(1).errors_on(:username)
    end
  end

  describe "with invalid characters" do
    it "like #email with incorrect format" do
      @user.email = '12345'
      @user.should_not be_valid
      @user.should have(1).errors_on(:email)
    end    

    it "like #username with special characteres" do
      @user.username = '+++++'
      @user.should_not be_valid
      @user.should have(1).errors_on(:username)

      @user.username = '$$$$$'
      @user.should_not be_valid
      @user.should have(1).errors_on(:username)
      
      @user.username = '#####'
      @user.should_not be_valid
      @user.should have(1).errors_on(:username)
      
      @user.username = '@@@@@'
      @user.should_not be_valid
      @user.should have(1).errors_on(:username)
      
      @user.username = '*****'
      @user.should_not be_valid
      @user.should have(1).errors_on(:username)
      
      @user.username = '&&&&&'
      @user.should_not be_valid
      @user.should have(1).errors_on(:username)
    end    
  end

  describe "with valid params" do
    it "like #email with correct format" do
      @user.email = 'test@test.com'
      @user.should be_valid
      @user.should have(0).errors_on(:email)
    end    

    it "like #username with alphabetical characteres" do
      @user.username = 'admin'
      @user.should be_valid
      @user.should have(0).errors_on(:username)
    end    
  end
  
  describe "abilities" do
    subject { ability }
    
    # context "when is an admin" do
    #  let( :user ){ FactoryGirl.create( :admin ) }
    #  let( :ability ){ Ability.new( user ) }
    #  it{ should be_able_to( :manage, :all ) }
    # end
    
    # context "when is an account manager" do
    #   let( :occupation ){ FactoryGirl.create( :manager ) }
    #   it{ occupation.permission_modulus.should have( 2 ).items }
    #   
    #   let( :user ){ FactoryGirl.create( :user, occupations: [occupation] ) }
    #   let( :ability ){ Ability.new( user ) }
    #   it{ should be_able_to( :read, User ) }
    #   it{ should be_able_to( :write, User ) }
    #   it{ should_not be_able_to( :delete, User ) }
    # end
  end
end

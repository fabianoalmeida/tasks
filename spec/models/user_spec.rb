require 'spec_helper'
require "cancan/matchers"

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
    
    before( :each ) do
      @user.save
      @ability = Ability.new(@user)
    end
    
    context "when #list is the model" do
      it "should be able to create a new list" do
        @ability.should be_able_to(:create, List.new)
      end

      it "should be able to read a list" do
        @ability.should be_able_to(:read, List.new)
      end

      it "should be able to update a new list" do
        list = FactoryGirl.create(:list, user: @user)
        @ability.should be_able_to(:update, list)
      end

      it "should be able to destroy a list" do
        list = FactoryGirl.create(:list, user: @user)
        @ability.should be_able_to(:destroy, list)
      end

      it "should be able to read a list from other user" do
        list = FactoryGirl.create(:list)
        @ability.should be_able_to(:read, list)
      end

      it "should not be able to update a list from other user" do
        list = FactoryGirl.create(:list)
        @ability.should_not be_able_to(:update, list)
      end

      it "should not be able to destroy a list from other user" do
        list = FactoryGirl.create(:list)
        @ability.should_not be_able_to(:destroy, list)
      end
    end
    
    context "when #task is the model" do
      it "should be able to create a new task" do
        @ability.should be_able_to(:create, Task.new)
      end

      it "should be able to read a task" do
        @ability.should be_able_to(:read, Task.new)
      end

      it "should be able to update a new task" do
        list = FactoryGirl.create(:list, user: @user)
        list.tasks << FactoryGirl.create(:task, list: list)
        @ability.should be_able_to(:update, list.tasks.first)
      end

      it "should be able to destroy a task" do
        list = FactoryGirl.create(:list, user: @user)
        list.tasks << FactoryGirl.create(:task, list: list)
        @ability.should be_able_to(:destroy, list.tasks.first)
      end

      it "should be able to read a task from other user" do
        list = FactoryGirl.create(:list)
        list.tasks << FactoryGirl.create(:task, list: list)
        @ability.should be_able_to(:read, list.tasks.first)
      end

      it "should not be able to update a task from other user" do
        list = FactoryGirl.create(:list)
        list.tasks << FactoryGirl.create(:task, list: list)
        @ability.should_not be_able_to(:update, list.tasks.first)
      end

      it "should not be able to destroy a task from other user" do
        list = FactoryGirl.create(:list)
        list.tasks << FactoryGirl.create(:task, list: list)
        @ability.should_not be_able_to(:destroy, list.tasks.first)
      end
    end
  end
end

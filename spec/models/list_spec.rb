require 'spec_helper'

describe List do

  before( :each ) do
    @list = FactoryGirl.build( :list )
  end

  describe "with invalid params" do
    it "like #name with nil value" do
      @list.name = nil
      @list.should_not be_valid
      @list.should have(1).errors_on(:name)
    end
    
    it "like #name with empty value" do
      @list.name = ''
      @list.should_not be_valid
      @list.should have(1).errors_on(:name)
    end

    it "like #limited with nil value" do
      @list.limited = nil
      @list.should_not be_valid
      @list.should have(1).errors_on(:limited)
    end
    
    it "like #limited with empty value" do
      @list.limited = ''
      @list.should_not be_valid
      @list.should have(1).errors_on(:limited)
    end
    
    it "like #user with nil value" do
      @list.user = nil
      @list.should_not be_valid
      @list.should have(1).errors_on(:user)
    end
  end

  describe "with valid characters" do
    it "like #limited with nil value" do
      @list.limited = true
      @list.should be_valid
      @list.should have(:no).errors_on(:limited)
    end
    
    it "like #limited with empty value" do
      @list.limited = false
      @list.should be_valid
      @list.should have(:no).errors_on(:limited)
    end
  end
  
  describe "having tasks" do
    it "should have no items" do
      @list.tasks.should have(:no).items
    end
    
    it "should have two items" do
      2.times {
        @list.tasks << FactoryGirl.build( :task )
      }
      @list.tasks.should have(2).items
    end
    
    it "should have one item after save" do
      @list.tasks << FactoryGirl.build( :task )
      @list.save
      @list.tasks.should have(1).items
    end
    
    it "should be destroy all tasks" do
      2.times {
        @list.tasks << FactoryGirl.build( :task )
      }
      @list.save.should be_true
      @list.tasks.should have(2).items
      first_task = @list.tasks.first
      @list.destroy.should be_true
      tasks = Task.where(list_id: @list.id)
      tasks.should have(:no).items
    end
  end
end

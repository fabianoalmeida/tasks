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

  describe "with invalid characters" do
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
end

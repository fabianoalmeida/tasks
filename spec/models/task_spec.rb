require 'spec_helper'

describe Task do

  before( :each ) do
    @task = FactoryGirl.build( :task )
  end

  describe "with invalid params" do
    it "like #name with nil value" do
      @task.name = nil
      @task.should_not be_valid
      @task.should have(1).errors_on(:name)
    end
    
    it "like #name with empty value" do
      @task.name = ''
      @task.should_not be_valid
      @task.should have(1).errors_on(:name)
    end

    it "like #list with nil value" do
      @task.list = nil
      @task.should_not be_valid
      @task.should have(1).errors_on(:list)
    end
  end
end

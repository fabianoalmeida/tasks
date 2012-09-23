require "spec_helper"

describe "After the user logged in" do
  include Warden::Test::Helpers
  Warden.test_mode!

  before :each do
    @user = FactoryGirl.create(:user, :email => 'user@example.com', :password => '123456')
    login_as(@user, :scope => :user)
    visit lists_path
    click_link 'New list'
    fill_in 'Name', :with => 'New Test List'
    click_button 'Create List'
  end

  it "create a new task", :js => true do
    click_link 'New task'
    fill_in 'task_name', :with => 'New Test Task'
    find_field('task_name').native.send_key(:enter)
  end
end
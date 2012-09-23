require "spec_helper"

describe "After the user logged in" do
  include Warden::Test::Helpers
  Warden.test_mode!

  before :each do
    @user = FactoryGirl.create(:user, :email => 'user@example.com', :password => '123456')
    login_as(@user, :scope => :user)
  end

  it "create a new list" do
    visit lists_path
    click_link 'New list'
    fill_in 'Name', :with => 'New Test List'
    click_button 'Create List'
  end
end
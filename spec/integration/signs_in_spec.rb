require "spec_helper"

describe "As a guest on the sign in page", :type => :request do

  before :each do
    @user = FactoryGirl.create(:user, :email => 'user@example.com', :password => '123456')
  end

  it "signs me in" do
    visit root_path
    fill_in 'user_login', :with => 'user@example.com'
    fill_in 'user_password', :with => '123456'
    click_button 'Sign in'
  end
end
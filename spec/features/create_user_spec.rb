require 'spec_helper'

describe User do
  it "should list existing users" do
    user = FactoryGirl.create(:user)
    visit users_path
    within 'table' do
      page.should have_content(user.email)
      page.should have_content(user.name)
    end
  end
  it "should have a new user link" do
    visit users_path
    click_link "New User"
    find :css, "form#new_user" do
      page.should have_content(user.email)
      page.should have_content(user.name)
    end
  end
  it "should create a new user" do
    users_count = User.count
    visit new_user_path
    
    fill_in "Email", with: "info@test.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    fill_in "Name", with: "Test User"
    click_button "Create User"
    
    User.count.should eq(users_count + 1)
    within "div.alert.alert-success" do
      page.should have_content "User was successfully created."
    end
  end
end
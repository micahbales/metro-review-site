require 'spec_helper'

RSpec.describe "user signs in" , %Q(
  As an authenticated user
  I want to sign out
  So that no one else can post items or reviews on my behalf
) do

  # Acceptance Criteria:

  # [x] I must be logged in
  # [x] When I select the Log Out link, my user is logged out
  # [x] I am redirected to the home page
  # [x] I see a message letting me know that I have been logged out

  scenario "user signs out successfully" do

    user = FactoryGirl.create(:user)

    visit "/"
 ### feel like there should be a better way to do this:
    click_link "Sign In"
    fill_in("Email", with: "bob@thebuilder.com")
    fill_in("Password", with: "password")
    click_button "Log In"
 ###
    click_link "Log Out"
    expect(page).to_not have_content("Log Out")
    expect(page).to_not have_content("Edit Account")
    expect(page).to have_content("You have signed out successfully.")
    expect(page).to have_content("Sign In")
  end
end

require 'spec_helper'

RSpec.feature "user signs in" , %Q(
  As an unauthenticated user
  I want to sign in
  So that I can post items and review them
) do

  # Acceptance Criteria:

  # [] I must enter a valid email address and password
  # [] If I do, then I am logged in & see a confirmation message
  # [] If I do not, then I am not logged in and see an error message

  scenario "user successfully signs in" do

    user = FactoryGirl.create(:user)

    visit "/"
    click_link "Sign In"
    fill_in("Email", with: "bob@thebuilder.com")
    fill_in("Password", with: "password")
    click_button "Log In"
    expect(page).to have_content("Log Out")
    expect(page).to have_content("Edit Account")
    expect(page).to have_content("You have signed in successfully.")
    expect(page).to_not have_content("Sign In")
  end

  scenario "user enters invalid information" do

    visit "/"
    click_link "Sign In"
    fill_in("Email", with: "bobby.com")
    fill_in("Password", with: "password")
    click_button "Log In"

    expect(page).to_not have_content("Log Out")
    expect(page).to_not have_content("Edit Account")
    expect(page).to_not have_content("You have signed in successfully.")
    expect(page).to have_content("Sign In")
    expect(page).to have_content("Invalid Email or password.")
  end
end

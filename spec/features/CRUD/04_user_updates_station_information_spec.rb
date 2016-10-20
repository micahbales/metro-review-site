require 'rails_helper'

RSpec.feature "user updates station info" , %Q(
  As an authenticated user
  I want to update a station's information
  So that I can correct errors or provide new information
) do

  # Acceptance Criteria:

  # [] I must be an authenticated user
  # [] When I view a station's details, I have an option to edit station info
  # [] I may edit a station's name, line, or state (but these details cannot
  #    be blank)
  # [] I may also optionally provide (or remove) a station description
  #    and parking info
  # [] If I enter updated information and submit, the station is updated

  xscenario "authenticated user updates station" do

    user = FactoryGirl.create(:user)
    station = FactoryGirl.create(:station)

    visit "/"
    login_user
    click_link("Benning Road")
    click_button("Update This Station")
    fill_in("Description", with: "The administration has threatened to close this station, among others")
    click_button("Update Station")

    expect(page).to have_content("The administration has threatened to close this station, among others")
    expect(page).to have_content("Your station has been successfully updated!")
  end

  xscenario "anonymous user cannot update station" do

    station = FactoryGirl.create(:station)

    visit "/"
    click_link("Benning Road")

    expect(page).to have_content("Benning Road Station")
    expect(page).to_not have_content("Update This Station")
  end
end

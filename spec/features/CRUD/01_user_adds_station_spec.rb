require 'rails_helper'

RSpec.feature "user adds station" , %Q(
  As an authenticated user
  I want to add a station
  So that others can review it
) do

  # Acceptance Criteria:

  # [] I must be an authenticated user
  # [] I must specify a station name, line, and state
  # [] I may optionally provide a station description
  # [] I may optionally specify whether a station has parking
  # [] If I enter the required information and submit, the station is created
  # [] If station is created, I am redirected to the new station page



  scenario "authenticated user successfully adds station" do

    user = FactoryGirl.create(:user)

    visit "/"
    login_user
    click_link("Add Station")
    fill_in("Station Name", with: "Benning Road")
    select("Blue", from: "Line")
    select("DC", from: "State")
    fill_in("Description", with: "Great little station!")
    check("Parking?")

    click_button("Add Station")

    expect(page).to have_content("Benning Road Station")
    expect(page).to have_content("Your station has been successfully added!")
    expect(page).to have_content("Description: Great little station!")
    expect(page).to have_content("Parking? Yes")
  end

  scenario "authenticated user omits required information" do

    user = FactoryGirl.create(:user)

    visit "/"
    login_user
    click_link("Add Station")
    select("Blue", from: "Line")
    select("DC", from: "State")
    click_button("Add Station")

    expect(page).to have_content("Add Station")
    expect(page).to have_content("Your station could not be created. Please provide all required information.")
  end
end

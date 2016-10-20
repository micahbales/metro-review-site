require 'spec_helper'

RSpec.feature "user deletes station" , %Q(
  As an authenticated user
  I want to delete a station
  So that no one can review it
) do

  # Acceptance Criteria:

  # [] I must be an authenticated user
  # [] When I view a station's details, I have an option to edit station info
  # [] In addition to editing station info, I can also delete the station
  # [] If I select to delete the station, the station is deleted from the site

  xscenario "authenticated user deletes station" do

    user = FactoryGirl.create(:user)
    station = FactoryGirl.create(:station)

    visit "/"
    login_user
    click_link("Benning Road")
    click_button("Update This Station")
    click_button("Delete Station")

    expect(page).to_not have_content("Benning Road")
    expect(page).to have_content("Station deleted from site")
  end
end

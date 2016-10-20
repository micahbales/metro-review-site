require 'spec_helper'

RSpec.feature "user views station details" , %Q(
  As an anonymous user
  I want to view the details about a station
  So that I can get more information about it
) do

  # Acceptance Criteria:

  # [] I may be an anonymous or authenticated user
  # [] When I visit the home page and view the list of stations
  #    I can click on an individual station to see more details
  # [] Visiting a station's details page, I can see that station's
  #    description and parking info, if provided

  xscenario "anonymous user views station details" do

    station = FactoryGirl.create(:station)

    visit "/"
    click_link("Benning Road")

    expect(page).to have_content("Benning Road Station")
    expect(page).to have_content("The last stop in Eastern DC")
    expect(page).to have_content("Parking? No")
  end
end

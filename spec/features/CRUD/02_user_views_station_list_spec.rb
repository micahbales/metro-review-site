require 'spec_helper'

RSpec.feature "user views list of stations" , %Q(
  As an anonymous user
  I want to view a list of stations
  So that I can pick items to review
) do

  # Acceptance Criteria:

  # [] I may be an anonymous or authenticated user
  # [] When I visit the home page, I can view a complete list of stations

  xscenario "anonymous user views station list" do

    station = FactoryGirl.create(:station)

    visit "/"

    expect(page).to have_content("Benning Road")
  end
end

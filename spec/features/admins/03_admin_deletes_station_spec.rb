require 'rails_helper'

RSpec.feature "admin deletes station" , %Q(
  As an admin user,
  I want to delete a station,
  So that only relevant stations are listed
) do

  # Acceptance Criteria:

  # [] I must be an authenticated user with admin privileges
  # [] When I navigate to the station update page, I have an option to
  #    delete the station

  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:station1) { FactoryGirl.create(:station) }
  let!(:station2) { FactoryGirl.create(:station, name: "Anacostia") }

  xscenario "admin deletes station" do

    visit "/"
    login_user
    click_link("Benning Road Station")
    click_link("Update Station")
    click_link("Delete Station")

    expect(page).to have_content("Anacostia Station")
    expect(page).to_not have_content("Benning Road Station")
    expect(page).to have_content("Station deleted!")

    DatabaseCleaner.clean
  end

  xscenario "non-admin user cannot delete station" do

    visit "/"
    click_link("Benning Road Station")
    click_link("Update Station")

    expect(page).to_not have_content("Delete Station")

    DatabaseCleaner.clean
  end
end

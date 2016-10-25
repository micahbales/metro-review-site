require 'rails_helper'

RSpec.feature "admin deletes review" , %Q(
  As an admin user,
  I want to delete a review,
  So that only helpful reviews are displayed
) do

  # Acceptance Criteria:

  # [] I must be an authenticated user with admin privileges
  # [] When I view a station's reviews, each one gives me the option
  #    to delete it

  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:station) { FactoryGirl.create(:station) }
  let!(:review) { FactoryGirl.create(:review) }

  xscenario "admin user deletes review" do

    visit "/"
    login_user
    click_link("Benning Road Station")
    click_link("review-delete-#{review.id}")

    expect(page).to have_content("Review deleted!")
    expect(page).to_not have_content("My Opinion 1")

    DatabaseCleaner.clean
  end

  xscenario "non-admin user cannot delete review" do


    DatabaseCleaner.clean
  end
end

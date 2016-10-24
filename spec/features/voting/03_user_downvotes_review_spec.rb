require 'rails_helper'

RSpec.feature "authenticated user downvotes review" , %Q(
  As an authenticated user
  I want to downvote reviews
  So that everyone can beware of bad answers
) do

  # Acceptance Criteria:

  # [x] I must be an authenticated user
  # [] When I visit a station page, I can see reviews of that station
  # [] Each review has a vote total displayed next to it
  # [] I can downvote any or all reviews
  # [] When I downvote the review, the total number of votes is decreased by one
  # [] I can only downvote once

  let!(:user) { FactoryGirl.create(:user) }
  let!(:station) { FactoryGirl.create(:station) }
  let!(:review1) { FactoryGirl.create(:review, station: station) }

  xscenario "authenticated user downvotes review" do

    visit "/"
    login_user
    click_link(station.name)
    first('.downvote > button').click

    expect(page).to have_content('-1')
    expect(page).to have_content('-1')

    DatabaseCleaner.clean
  end
end

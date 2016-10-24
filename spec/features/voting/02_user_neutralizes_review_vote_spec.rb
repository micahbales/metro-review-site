require 'rails_helper'

RSpec.feature "authenticated user neutralizes vote on review" , %Q(
  As an authenticated user
  I want to undo my vote
  So that I can correct my mistakes
) do

  # Acceptance Criteria:

  # [x] I must be an authenticated user
  # [] When I click the vote button of a review I have already upvoted
  #    the total number of votes is reduced by one

  let!(:user) { FactoryGirl.create(:user) }
  let!(:station) { FactoryGirl.create(:station) }
  let!(:review1) { FactoryGirl.create(:review, station: station) }

  xscenario "authenticated user upvotes review" do

    visit "/"
    login_user
    click_link(station.name)
    first('.upvote > button').click
    first('.downvote > button').click

    expect(page).to have_content('0')
    expect(page).to have_content('-1')

    DatabaseCleaner.clean
  end
end

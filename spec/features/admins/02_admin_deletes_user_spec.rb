require 'rails_helper'

RSpec.feature "admin deletes user" , %Q(
  As an admin user,
  I want to delete a user,
  So that the database is cleared of inactive or abusive users
) do

  # Acceptance Criteria:

  # [] I must be an authenticated user with admin privileges
  # [] On the users index page, I can view all registered users
  # [] When I visit the users index page, I can delete any listed user

  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user, first_name: James, last_name: Baldwin, email: "jimmyb@juno.com") }

  scenario "admin deletes user" do

    visit "/"
    login_user
    click_link("View All Users")
    click_link("user-delete-#{user1.id}")


    expect(page).to_not have_content("Bob Builder")
    expect(page).to have_content("James Baldwin")
    expect(page).to have_content("User deleted!")

    DatabaseCleaner.clean
  end
end

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

  scenario "admin deletes user" do


    DatabaseCleaner.clean
  end
end

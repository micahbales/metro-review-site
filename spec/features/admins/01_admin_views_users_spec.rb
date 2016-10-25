require 'rails_helper'

RSpec.feature "admin views all users" , %Q(
  As an admin user,
  I want to view a list of all users,
  So that I can administrate them
) do

  # Acceptance Criteria:

  # [] I must be an authenticated user with admin privileges
  # [] When I visit the users list, I can see all registered users

  scenario "admin visits users index" do


    DatabaseCleaner.clean
  end

  scenario "non-admin user cannot visit users index" do


    DatabaseCleaner.clean
  end
end

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

  scenario "admin deletes station" do


    DatabaseCleaner.clean
  end

  scenario "non-admin user cannot delete station" do


    DatabaseCleaner.clean
  end
end

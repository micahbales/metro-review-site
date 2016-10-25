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

  scenario "admin user deletes review" do



    DatabaseCleaner.clean
  end

  scenario "non-admin user cannot delete review" do


    DatabaseCleaner.clean
  end
end

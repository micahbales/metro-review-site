require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should have_valid(:title).when('This is great', 'zyx') }
  it { should_not have_valid(:title).when(nil, '')}

  it { should have_valid(:content).when('Benning Road station is a great one!', 'Yo.') }
  it { should_not have_valid(:content).when(nil, '') }
end

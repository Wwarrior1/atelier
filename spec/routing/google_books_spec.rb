require_relative '../rails_helper'

RSpec.describe 'routes to the google_books', type: :routing do
  it { expect(get: '/google-isbn').to route_to('google_books#show') }
end
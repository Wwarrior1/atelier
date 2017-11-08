require_relative '../rails_helper'

RSpec.describe 'routes to the reservations', type: :routing do
  it {expect(get: 'books/12/reserve').to route_to('reservations#reserve', book_id: '12')}
  it {expect(get: 'books/11/take').to route_to('reservations#take', book_id: '11')}
  it {expect(get: 'books/10/give_back').to route_to('reservations#give_back', book_id: '10')}
  it {expect(get: 'books/9/cancel_reservation').to route_to('reservations#cancel', book_id: '9')}
  it {expect(get: 'users/8/reservations').to route_to('reservations#users_reservations', user_id: '8')}
end
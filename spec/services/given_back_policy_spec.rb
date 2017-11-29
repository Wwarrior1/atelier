require 'rails_helper'

# 2nd approach
# Better than in book_spec.rb

RSpec.describe GivenBackPolicy, type: :service do
  let(:user) { double }
  let(:book) { double }
  subject { described_class.new(user: user, book: book) }

  before do
    expect(book).to receive_message_chain(:reservations, :find_by)
                        .with(no_args)
                        .with(user: user, status: 'TAKEN')
                        .and_return(reservation)
  end

  describe '#applies' do
    context 'with reservation' do
      let(:reservation) { double }

      it {
        expect(subject.applies?).to be_truthy
      }
    end

    context 'without reservation' do
      let(:reservation) { nil }

      it {
        expect(subject.applies?).to be_falsey
      }
    end
  end

end
require 'rails_helper'

# 1st approach
# It can be deleted because of newly created 'given_back_policy_spec.rb' has better approach

RSpec.describe Book, type: :model do
  subject { described_class.new }

  describe '#can_give_back' do
    let(:user) { User.new }

    before do
      expect(subject).to receive_message_chain(:reservations, :find_by)
          .with(no_args)
          .with(user: user, status: 'TAKEN')
          .and_return(reservation)
    end

    context 'without any reservation' do
      let(:reservation) { nil }
      it {
        expect(subject.can_give_back?(user)).to be_falsey
      }
    end

    context 'with reservation' do
      let(:reservation) { double }
      it {
        expect(subject.can_give_back?(user)).to be_truthy
      }
    end
  end
end
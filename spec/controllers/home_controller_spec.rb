require "rails_helper"

RSpec.describe HomeController, :type => :controller do
  context 'When logged in as an admin' do
    login_admin

    describe 'GET index' do
      subject { get(:index) }

      it 'redirects to the admin portal' do
        expect(subject).to redirect_to(admin_url)
      end
    end
  end

  context 'When logged in as a user' do
    login_user

    describe 'GET index' do
      subject { get(:index) }

      it 'redirects to the new bookings page' do
        expect(subject).to redirect_to(new_booking_url)
      end
    end
  end

  context 'When not logged in' do
    describe 'GET index' do
      subject { get(:index) }

      it 'redirects to the login page' do
        expect(subject).to redirect_to(new_user_session_url)
      end
    end
  end
end

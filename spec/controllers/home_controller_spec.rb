require "rails_helper"

RSpec.describe HomeController, :type => :controller do
  describe 'GET index' do
    context 'when logged in as admin' do
      login_admin

      before do
        get :index
      end

      it 'redirects to the admin portal' do
        expect(response).to redirect_to(admin_url)
      end
    end

    context 'when logged in as a user' do
      login_user

      before do
        get :index
      end

      it 'redirects to the new booking page' do
        expect(response).to redirect_to(new_booking_url)
      end
    end

    context 'when not logged in' do
      before do
        get :index
      end

      it 'redirects to the login page' do
        expect(response).to redirect_to(new_user_session_url)
      end
    end
  end
end

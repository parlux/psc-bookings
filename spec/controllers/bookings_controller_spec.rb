require "rails_helper"

RSpec.describe BookingsController, :type => :controller do
  let(:booking) { instance_double(Booking) }

  before do
    allow(Booking).to receive(:new).and_return(booking)
  end

  describe 'GET new' do
    context 'When logged in' do
      login_random

      before do
        get :new
      end

      it 'renders the new template' do
        expect(response).to render_template("new")
      end

      it 'assigns booking' do
        expect(assigns(:booking)).to eq(Booking.new)
      end
    end
  end

  context 'When not logged in' do
    before do
      get :new
    end

    it 'redirects to the login page' do
      expect(response).to redirect_to(new_user_session_url)
    end
  end
end

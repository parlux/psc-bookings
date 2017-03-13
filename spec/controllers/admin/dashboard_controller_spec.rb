require "rails_helper"

RSpec.describe Admin::DashboardController, :type => :controller do
  let(:unordered_bookings) { double('Bookings', order: bookings) }
  let(:bookings) { [ instance_double(Booking), instance_double(Booking)] }

  before do
    allow(Booking).to receive(:all).and_return(unordered_bookings)
  end

  describe 'GET index' do
    context 'When logged in as admin' do
      login_admin

      before do
        get :index
      end

      it 'renders the index template' do
        expect(response).to render_template("index")
      end

      it 'assigns bookings' do
        expect(assigns(:bookings)).to eq(bookings)
      end
    end

    context 'When insufficient priviledges' do
      login_user

      before do
        get :index
      end

      it 'redirects back to the home page' do
        expect(subject).to redirect_to(root_url)
      end
    end

    context 'When not logged in' do
      before do
        get :index
      end

      it 'redirects back to the home page' do
        expect(subject).to redirect_to(new_user_session_url)
      end
    end
  end
end
